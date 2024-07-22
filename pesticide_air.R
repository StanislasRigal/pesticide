# Load data on pesticide in the air https://www.data.gouv.fr/fr/datasets/base-de-donnee-de-surveillance-de-pesticides-dans-l-air-par-les-aasqa-a-partir-de-2002/

pesticide_raw <- read.csv2("raw_data/pesticides-2002-2022-v03-2024-vf.csv")

pesticide_raw <- pesticide_raw[which(!(pesticide_raw$AASQA %in% c("HAWA MAYOTTE","ATMO REUNION","ATMO GUYANE","MADININAIR","GWADAIR"))),]

# load geographical data for French communes from https://public.opendatasoft.com/explore/dataset/georef-france-commune-arrondissement-municipal-millesime/export/?disjunctive.reg_name&disjunctive.dep_name&disjunctive.arrdep_name&disjunctive.ze2020_name&disjunctive.bv2012_name&disjunctive.epci_name&disjunctive.ept_name&disjunctive.com_name&disjunctive.com_arm_name&disjunctive.com_arm_is_mountain_area&sort=year&location=6,46.97276,3.93311&basemap=jawg.light

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")


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
  geom_sf(data = pesticide_air_folpel_sf, mapping = aes(col = qte))

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
fr$pred1 <- a$mean.var1.pred_lyr.1
ggplot() + geom_sf(data = fr, mapping = aes(fill = pred1),col=NA) +
  scale_fill_gradientn(colors = sf.colors(20))
