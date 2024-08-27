# Load data on pesticide in the air https://www.data.gouv.fr/fr/datasets/base-de-donnee-de-surveillance-de-pesticides-dans-l-air-par-les-aasqa-a-partir-de-2002/

pesticide_raw <- read.csv2("raw_data/pesticides-2002-2022-v03-2024-vf.csv")

pesticide_raw <- pesticide_raw[which(!(pesticide_raw$AASQA %in% c("HAWA MAYOTTE","ATMO REUNION","ATMO GUYANE","MADININAIR","GWADAIR"))),]

# load geographical data for French communes from https://public.opendatasoft.com/explore/dataset/georef-france-commune-arrondissement-municipal-millesime/export/?disjunctive.reg_name&disjunctive.dep_name&disjunctive.arrdep_name&disjunctive.ze2020_name&disjunctive.bv2012_name&disjunctive.epci_name&disjunctive.ept_name&disjunctive.com_name&disjunctive.com_arm_name&disjunctive.com_arm_is_mountain_area&sort=year&location=6,46.97276,3.93311&basemap=jawg.light

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")

# measurement sites

station_site <- st_as_sf(distinct(pesticide_raw[,c("xlamb93","ylamb93")]), coords = c("xlamb93","ylamb93"), remove = FALSE, crs="EPSG:2154")

code_postal_site <- code_postal[which(!(code_postal$nom_region %in% c("GUYANE","MAYOTTE","GUADELOUPE","MARTINIQUE","REUNION"))),]
code_postal_outline <- st_union(code_postal_site)
code_postal_outline_reproj <- st_transform(code_postal_outline,crs="EPSG:2154")

ggplot(code_postal_outline_reproj)+
  geom_sf() + geom_sf(data=station_site) + theme_minimal()

ggsave("output/figure_station_air.png",
       width = 6,
       height = 6,
       dpi = 400)



# average pesticide data by postal code

pesticide_raw$Concentration..ng.m3. <- as.numeric(pesticide_raw$Concentration..ng.m3.)

pesticide_air_average <- data.frame(pesticide_raw %>% group_by(Code.INSEE) %>% summarize(qte=mean(Concentration..ng.m3., na.rm=TRUE)))
pesticide_air_average_sa <- data.frame(pesticide_raw %>% group_by(Code.INSEE,Substance.active) %>% summarize(qte=mean(Concentration..ng.m3., na.rm=TRUE)))


# merge both datasets

com_pest_air <- merge(code_postal,pesticide_air_average, by.x="insee_com",by.y="Code.INSEE",all.x=TRUE) 

ggplot(com_pest_air)+
  geom_sf(aes(fill=qte), colour=NA) +
  theme(axis.text=element_blank()) +
  coord_sf(xlim = c(-5,9),ylim=c(41,52))

# Kriging analysis from https://r-spatial.org/book/12-Interpolation.html

## First test with Folpel, make it spatial

pesticide_air_folpel <- data.frame(pesticide_raw[which(pesticide_raw$Substance.active=="Folpel"),] %>% group_by(AASQA,Commune,Code.INSEE,xlamb93,ylamb93) %>% summarize(qte=mean(Concentration..ng.m3., na.rm=TRUE)))

pesticide_air_folpel_sf <- st_as_sf(pesticide_air_folpel, crs = "EPSG:2154", coords = c("xlamb93", "ylamb93"))

fr <- st_transform(code_postal[which(!(code_postal$nom_region %in% c("GUYANE","MAYOTTE","GUADELOUPE","MARTINIQUE","REUNION"))),],crs = "EPSG:2154" ) 

ggplot() + geom_sf(data = fr) + 
  geom_sf(data = pesticide_air_folpel_sf, mapping = aes(col = qte))+
  scale_color_gradientn(colors = sf.colors(20))

## Get a grid for interpolation

library(stars) 
grd <- st_crop(st_as_stars(st_bbox(fr),dx = 10000),fr)

## First interpolation with inverse distance

library(gstat)
i <- idw(qte~1, pesticide_air_folpel_sf, grd)

ggplot() + geom_stars(data = i, 
                      aes(fill = var1.pred, x = x, y = y)) + 
  xlab(NULL) + ylab(NULL) +
  #geom_sf(data = st_cast(fr, "MULTILINESTRING")) + 
  geom_sf(data = pesticide_air_folpel_sf) + 
  theme_minimal()

## Sample variogram

v <- variogram(qte~1, pesticide_air_folpel_sf,cutoff=40000)
plot(v, plot.numbers = TRUE, xlab = "distance h [m]",
     ylab = expression(gamma(h)),
     xlim = c(0, 1.055 * max(v$dist)))

v.m <- fit.variogram(v, vgm("Exp"))

plot(v, v.m, plot.numbers = TRUE)


## First kriging

k <- krige(qte~1, pesticide_air_folpel_sf, grd, v.m)
ggplot() + geom_stars(data = k, aes(fill = var1.pred, x = x, y = y)) + 
  xlab(NULL) + ylab(NULL) +
  geom_sf(data = pesticide_air_folpel_sf) +
  coord_sf(lims_method = "geometry_bbox")

library(terra)
library(exactextractr)
k_rast <- rast(k)

a <- exact_extract(k_rast, fr, fun = "mean")
a_var <- exact_extract(k_rast, fr, fun = "variance")
fr$pred1 <- a$mean.var1.pred_var1.pred
fr$var_pred1 <- a_var$variance.var1.pred_var1.pred
ggplot() + geom_sf(data = fr, mapping = aes(fill = sqrt(pred1)),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))
ggplot() + geom_sf(data = fr, mapping = aes(fill = sqrt(var_pred1)),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))

## Trend model with SA use

pesticide_pre_itt_sau <- readRDS("output/pesticide_pre_itt_sau.rds")
#folpel_use <- pesticide_pre_itt_sau[grep("folpel",pesticide_pre_itt_sau$Substances.actives),]
folpel_use <- pesticide_pre_itt_sau[which(pesticide_pre_itt_sau$substance=="folpel"),]
folpel_use <- folpel_use[which(folpel_use$sau_tot > 0),]
folpel_use <- data.frame(folpel_use %>% group_by(code_postal_acheteur,annee) %>% summarize(itt_year = sum(itt)))
folpel_use <- data.frame(folpel_use %>% group_by(code_postal_acheteur) %>% summarize(itt_mean = mean(itt_year)))

fr_folpel_use <- merge(fr,folpel_use,by.x="postal_code",by.y="code_postal_acheteur", all.x=TRUE)
fr_folpel_use$itt_mean[which(is.na(fr_folpel_use$itt_mean))] <- 0
ggplot() + geom_sf(data = fr_folpel_use, mapping = aes(fill = sqrt(itt_mean)),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))

folpel_air_use <- st_intersection(pesticide_air_folpel_sf,fr_folpel_use)
folpel_air_use <- folpel_air_use[which(folpel_air_use$itt_mean<1),]
summary(lm(qte~sqrt(itt_mean), folpel_air_use))

vr <- variogram(qte~sqrt(itt_mean), folpel_air_use,cutoff=40000)
vr.m <- fit.variogram(vr, vgm("Exp"))

plot(vr, vr.m, plot.numbers = TRUE)

## Kriging with SA use

grd_folpel <- st_rasterize(fr_folpel_use, st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))
st_crs(grd_folpel) <- st_crs(fr_folpel_use)

kr <- krige(qte~sqrt(itt_mean), folpel_air_use, grd_folpel["itt_mean"], vr.m)

kr_rast <- rast(kr)

ar <- exact_extract(kr_rast, fr, fun = "mean")
ar_var <- exact_extract(kr_rast, fr, fun = "variance")
fr$pred1_r <- ar$mean.var1.pred_var1.pred
fr$var_pred1_r <- ar_var$variance.var1.pred_var1.pred
ggplot() + geom_sf(data = fr, mapping = aes(fill = sqrt(pred1_r)),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))
ggplot() + geom_sf(data = fr, mapping = aes(fill = sqrt(var_pred1)),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))

grd_folpel$pred_folpel <- kr[["var1.pred"]]
grd_folpel_sf <- st_as_sf(grd_folpel)
ggplot() + geom_sf(data = grd_folpel_sf, mapping = aes(fill = sqrt(pred_folpel)),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))

# generalise to all sa

## Load raw data

pesticide_pre_itt_sau <- readRDS("output/pesticide_pre_itt_sau.rds")

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")

fr <- st_transform(code_postal[which(!(code_postal$nom_region %in% c("GUYANE","MAYOTTE","GUADELOUPE","MARTINIQUE","REUNION"))),],crs = "EPSG:2154" ) 

fr_air_all <- st_as_sf(st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))

pesticide_air_station <- read.csv2("raw_data/pesticides-2002-2022-v03-2024-vf.csv")
pesticide_air_station <- pesticide_air_station[which(!(pesticide_air_station$AASQA %in% c("HAWA MAYOTTE","ATMO REUNION","ATMO GUYANE","MADININAIR","GWADAIR"))),]
pesticide_air_station$Concentration..ng.m3. <- as.numeric(pesticide_air_station$Concentration..ng.m3.)


## get sa molecule to follow

sa_pesticide <- unique(pesticide_pre_itt_sau$Substances.actives)
molecul_followed <- as.matrix(unique(pesticide_air_station$Substance.active))

match_molecul_sa <- apply(molecul_followed,1,function(x,vect_sa){grep(x,vect_sa,ignore.case = TRUE)},vect_sa=sa_pesticide)

molecul_sa <- unique(pesticide_air_station$Substance.active)[which(sapply(match_molecul_sa, FUN = function(x){!(is.integer(x) && length(x) == 0)}))]

pesticide_air_station_sub <- pesticide_air_station[which(pesticide_air_station$Substance.active %in% molecul_sa),]



for(i in 1:length(unique(pesticide_air_station_sub$Substance.active))){
  
  print(i)
  
  sa_name <- unique(pesticide_air_station_sub$Substance.active)[i]
  sa_name_use <- sa_pesticide[unlist(match_molecul_sa[which(unique(pesticide_air_station$Substance.active) == sa_name)])]
  
  pesticide_air_sa <- data.frame(pesticide_air_station_sub[which(pesticide_air_station_sub$Substance.active == sa_name),] %>% group_by(AASQA,Commune,Code.INSEE,xlamb93,ylamb93) %>% summarize(qte=mean(Concentration..ng.m3., na.rm=TRUE)))
  
  pesticide_air_sa_sf <- st_as_sf(pesticide_air_sa, crs = "EPSG:2154", coords = c("xlamb93", "ylamb93"))
  
  sa_use <- pesticide_pre_itt_sau[which(pesticide_pre_itt_sau$Substances.actives %in% sa_name_use),]
  sa_use <- sa_use[which(sa_use$sau_tot > 0),]
  sa_use <- data.frame(sa_use %>% group_by(code_postal_acheteur,annee) %>% summarize(itt_year = sum(itt)))
  sa_use <- data.frame(sa_use %>% group_by(code_postal_acheteur) %>% summarize(itt_mean = mean(itt_year)))
  
  fr_sa_use <- merge(fr,sa_use,by.x="postal_code",by.y="code_postal_acheteur", all.x=TRUE)
  fr_sa_use$itt_mean[which(is.na(fr_sa_use$itt_mean))] <- 0
  
  sa_air_use <- st_intersection(pesticide_air_sa_sf,fr_sa_use)
  sa_air_use <- sa_air_use[which(sa_air_use$itt_mean<1),]
  
  if(nrow(sa_air_use) > 9){
    if(max(sa_air_use$itt_mean) > 0){
      vr <- variogram(qte~itt_mean, sa_air_use,cutoff=100000)
      vr.m <- fit.variogram(vr, vgm("Exp"))
      #plot(vr, vr.m, plot.numbers = TRUE)
      
      ### Kriging with SA use
      
      grd_sa <- st_rasterize(fr_sa_use, st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))
      st_crs(grd_sa) <- st_crs(fr_sa_use)
      
      kr <- krige(qte~itt_mean, sa_air_use, grd_sa["itt_mean"], vr.m)
    }else{
      vr <- variogram(qte~1, sa_air_use,cutoff=100000)
      vr.m <- fit.variogram(vr, vgm("Exp"))
      #plot(vr, vr.m, plot.numbers = TRUE)
      
      ### Kriging with SA use
      
      grd_sa <- st_rasterize(fr_sa_use, st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))
      st_crs(grd_sa) <- st_crs(fr_sa_use)
      
      kr <- krige(qte~1, sa_air_use, grd_sa["itt_mean"], vr.m)
    }
    
    grd_sa$pred_sa <- kr[["var1.pred"]]
    grd_sa_sf <- st_as_sf(grd_sa)
    
    fr_air_all$new_col <- grd_sa_sf$pred_sa
    
  }else{
    
    fr_air_all$new_col <- NA
    
  }
  
  names(fr_air_all)[which(names(fr_air_all) == "new_col")] <- sa_name
  
}

saveRDS(fr_air_all,"output/fr_air_all.rds")
fr_air_all <- readRDS("output/fr_air_all.rds")

ggplot() + geom_sf(data = fr_air_all, mapping = aes(fill = sqrt(Aclonifen)),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))

fr_air_df <- fr_air_all
st_geometry(fr_air_df) <- NULL
fr_air_df$values <- NULL
fr_air_df <- fr_air_df[ , colSums(is.na(fr_air_df))==0]
fr_air_df[fr_air_df < 0] <- 0
fr_air_all$C_tot <- apply(fr_air_df,1,sum)

fr_air_df_scale <- apply(fr_air_df,2,function(x){scale(x,center=FALSE)})
fr_air_df_scale <- fr_air_df_scale[ , colSums(is.na(fr_air_df_scale))==0]
fr_air_all$C_tot_scale <- apply(fr_air_df_scale,1,sum)


### by year

fr_air_all_year <- st_as_sf(st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))

for(i in 1:length(unique(pesticide_air_station_sub$Substance.active))){ #
  
  print(i)
  
  sa_name <- unique(pesticide_air_station_sub$Substance.active)[i]
  sa_name_use <- sa_pesticide[unlist(match_molecul_sa[which(unique(pesticide_air_station$Substance.active) == sa_name)])]
  
  pesticide_air_sa <- data.frame(pesticide_air_station_sub[which(pesticide_air_station_sub$Substance.active == sa_name),] %>% group_by(AASQA,Commune,Code.INSEE,xlamb93,ylamb93,Annee) %>% summarize(qte=mean(Concentration..ng.m3., na.rm=TRUE)))
  
  pesticide_air_sa <- pesticide_air_sa[which(pesticide_air_sa$Annee > 2012),]
  
  year_follow <- sort(unique(pesticide_air_sa$Annee))
  
  for(y in year_follow[1]:year_follow[length(year_follow)]){
    
    pesticide_air_sa_y <- pesticide_air_sa[which(pesticide_air_sa$Annee == y),]
    
    pesticide_air_sa_sf <- st_as_sf(pesticide_air_sa_y, crs = "EPSG:2154", coords = c("xlamb93", "ylamb93"))
    
    sa_use <- pesticide_pre_itt_sau[which(pesticide_pre_itt_sau$Substances.actives %in% sa_name_use & pesticide_pre_itt_sau$annee == y),]
    sa_use <- sa_use[which(sa_use$sau_tot > 0),]
    sa_use <- data.frame(sa_use %>% group_by(code_postal_acheteur,annee) %>% summarize(itt_year = sum(itt)))
    sa_use <- data.frame(sa_use %>% group_by(code_postal_acheteur) %>% summarize(itt_mean = mean(itt_year)))
    
    fr_sa_use <- merge(fr,sa_use,by.x="postal_code",by.y="code_postal_acheteur", all.x=TRUE)
    fr_sa_use$itt_mean[which(is.na(fr_sa_use$itt_mean))] <- 0
    
    sa_air_use <- st_intersection(pesticide_air_sa_sf,fr_sa_use)
    sa_air_use <- sa_air_use[which(sa_air_use$itt_mean<1),]
    
    if(nrow(sa_air_use) > 9 & max(sa_air_use$qte > 0)){
      if(max(sa_air_use$itt_mean) > 0){
        
        vr <- variogram(qte~itt_mean, sa_air_use,cutoff=100000)
        vr.m <- fit.variogram(vr, vgm("Exp"))
        #plot(vr, vr.m, plot.numbers = TRUE)
        
        ### Kriging with SA use
        
        grd_sa <- st_rasterize(fr_sa_use, st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))
        st_crs(grd_sa) <- st_crs(fr_sa_use)
        
        kr <- krige(qte~itt_mean, sa_air_use, grd_sa["itt_mean"], vr.m)
        
      }else{
        
        vr <- variogram(qte~1, sa_air_use,cutoff=100000)
        vr.m <- fit.variogram(vr, vgm("Exp"))
        #plot(vr, vr.m, plot.numbers = TRUE)
        
        ### Kriging with SA use
        
        grd_sa <- st_rasterize(fr_sa_use, st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))
        st_crs(grd_sa) <- st_crs(fr_sa_use)
        
        kr <- krige(qte~1, sa_air_use, grd_sa["itt_mean"], vr.m)
        
      }
      
      grd_sa$pred_sa <- kr[["var1.pred"]]
      grd_sa_sf <- st_as_sf(grd_sa)
      
      fr_air_all_year$new_col <- grd_sa_sf$pred_sa
    }else{
      
      fr_air_all_year$new_col <- NA
      
    }
    
    names(fr_air_all_year)[which(names(fr_air_all_year) == "new_col")] <- paste0(sa_name,sep="_",y)
    
  }
  
}

saveRDS(fr_air_all_year,"fr_air_all_year.rds")
fr_air_all_year <- readRDS("output/fr_air_all_year.rds")

fr_air_all_year$id <- 1:nrow(fr_air_all_year)

fr_air_all_year_df <- fr_air_all_year
st_geometry(fr_air_all_year_df) <- NULL
fr_air_all_year_df$values <- NULL

df_sa_year <- fr_air_all_year[,c("id")]
df_sa_year$year <- c(rep(2013:2022,length(unique(df_sa_year$id))/10),2013,2014)

df_sa_year_long <- data.frame(data.frame(df_sa_year) %>% complete(id,year))[,1:2]
df_sa_year$year <- NULL
df_sa_year_long <- merge(df_sa_year, df_sa_year_long, by=c("id"))

for(i in 1:length(unique(pesticide_air_station_sub$Substance.active))){
  
  print(i)
  
  sa_name <- sort(unique(pesticide_air_station_sub$Substance.active))[i]
  
  sub_df <- fr_air_all_year_df[,c(which(str_sub(names(fr_air_all_year_df),1,-6) == sa_name),ncol(fr_air_all_year_df))]
  
  if(length(which(str_sub(names(fr_air_all_year_df),1,-6) == sa_name))>0){
    
    if(length(names(sub_df)) < 11){
      
      exist_year <- str_sub(names(sub_df[,c(1:(ncol(sub_df)-1))]),-4,-1)
      missing_year <- c(2013:2022)[which(!(c(2013:2022) %in% exist_year))]
      
      while(length(missing_year) > 0){
        sub_df$new_col <- NA
        names(sub_df)[which(names(sub_df)=="new_col")] <- paste0(sa_name,sep="_",missing_year[1])
        missing_year <- missing_year[-1]
      }
      
    }
    
    sub_df_long <- melt(sub_df,id.vars = "id")
    sub_df_long$year <- str_sub(sub_df_long$variable,-4,-1)
    
    sub_df_long <- with(sub_df_long, sub_df_long[order(id,year),])
    
    df_sa_year_long$new_col <- sub_df_long$value
    
    names(df_sa_year_long)[which(names(df_sa_year_long)=="new_col")] <- sa_name
    
  }

}

saveRDS(df_sa_year_long,"output/df_sa_year_long.rds")
df_sa_year_long <- readRDS("output/df_sa_year_long.rds")
