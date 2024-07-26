# Load data on pesticide in surface water 

# first possibility from https://www.data.gouv.fr/fr/datasets/pesticides-dans-les-eaux-souterraines/

station_water <- read.csv2("raw_data/stations.csv")

info_pesticide_water <- read.csv2("raw_data/pesticides.csv")

pesticide_water_2007 <- read.csv2("raw_data/ma_qp_fm_ttres_pesteso_2007.csv")
pesticide_water_2008 <- read.csv2("raw_data/ma_qp_fm_ttres_pesteso_2008.csv")
pesticide_water_2009 <- read.csv2("raw_data/ma_qp_fm_ttres_pesteso_2009.csv")
pesticide_water_2010 <- read.csv2("raw_data/ma_qp_fm_ttres_pesteso_2010.csv")
pesticide_water_2011 <- read.csv2("raw_data/ma_qp_fm_ttres_pesteso_2011.csv")
pesticide_water_2012 <- read.csv2("raw_data/ma_qp_fm_ttres_pesteso_2012.csv")

# second possibility less limited in time from https://naiades.eaufrance.fr/france-entiere#/

## test with subdataset

station_water <- read.csv2("raw_data/test_naiade/Stations.CSV")

pesticide_water <- read.csv2("raw_data/test_naiade/Analyses.CSV")

pesticide_water_quanti <- pesticide_water[which(pesticide_water$MnemoRqAna == "Résultat > seuil de quantification et < au seuil de saturation"),] # no difference between true absence and below quantification threshold for the rest


# station data for all data

#station_water <- read.csv2("raw_data/naiade_all/stations.csv") issue with station data provided by naiade, missing station
# so directly use sandre data https://www.sandre.eaufrance.fr/atlas/srv/fre/catalog.search#/metadata/71767e88-a021-4e88-8787-5feed04958d6  (Stations de mesure de la qualité des eaux superficielles continentales (STQ) - Métropole )

station_water <- st_read("raw_data/naiade_all/StationMesureEauxSurface_FXX.gpkg")

station_water_metro <- station_water[which(station_water$CoordYStationMesureEauxSurface>4000000),]

### by year

pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2013.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2014.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2015.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2016.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2017.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2018.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2019.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2020.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2021.csv")
pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2022.csv")

## subset data from all data to get a small dataset

pesticide_water <- pesticide_water[which(pesticide_water$LbQualAna == "Correcte" & pesticide_water$LbSupport == "Eau"),]
gc()

### true 0

pesticide_water$LdAna <- as.numeric(pesticide_water$LdAna)
pesticide_water$LqAna <- as.numeric(pesticide_water$LqAna)

min_threshold <- pesticide_water[,c("LbLongParamètre","LdAna","LqAna")]

min_threshold <- as.data.frame(min_threshold %>% group_by(LbLongParamètre) %>% summarize(min_LdAna = min(LdAna, na.rm=TRUE), min_LqAna = min(LqAna, na.rm=TRUE)))

pesticide_water_true0 <- pesticide_water[which(pesticide_water$MnemoRqAna == "Résultat < seuil de détection"),]

pesticide_water_true0 <- ddply(pesticide_water_true0, .(LbLongParamètre),
      .fun = function(x,min_threshold){
        molecule <- unique(x$LbLongParamètre)
        min_threshold_molecule <- min_threshold$min_LdAna[which(min_threshold$LbLongParamètre == molecule)]
        return(x[which(x$LdAna == min_threshold_molecule),])
      }, min_threshold=min_threshold, .progress = "text")

### trace

pesticide_water_trace <- pesticide_water[which(pesticide_water$MnemoRqAna %in% c("Traces (< seuil de quantification et > seuil de détection)","Résultat < au seuil de quantification")),]
gc()
pesticide_water_trace <- ddply(pesticide_water_trace, .(LbLongParamètre),
                               .fun = function(x,min_threshold){
                                 molecule <- unique(x$LbLongParamètre)
                                 min_threshold_molecule <- min_threshold$min_LqAna[which(min_threshold$LbLongParamètre == molecule)]
                                 return(x[which(x$LqAna == min_threshold_molecule),])
                               }, min_threshold=min_threshold, .progress = "text")
gc()

### true quantification

pesticide_water_present <- pesticide_water[which(pesticide_water$MnemoRqAna == "Résultat > seuil de quantification et < au seuil de saturation"),]
rm(pesticide_water)
gc()

pesticide_water_true0$RsAna_interpreted <- 0 # zero if < to the lowest detection threshold
pesticide_water_trace$RsAna_interpreted <- pesticide_water_trace$LdAna # at least detection threshold if < to the minimal quantification threshold
pesticide_water_trace <- pesticide_water_trace[which(!is.na(pesticide_water_trace$RsAna_interpreted)),]
pesticide_water_present$RsAna_interpreted <- pesticide_water_present$RsAna

pesticide_water_quanti <- rbind(pesticide_water_true0,pesticide_water_trace,pesticide_water_present)


### get sa molecule to follow
usage_produit_sa_unique <- readRDS("output/usage_produit_sa_unique.rds")

sa_pesticide <- unique(usage_produit_sa_unique$Substances.actives)
molecul_followed <- as.matrix(unique(pesticide_water_quanti$LbLongParamètre))

match_molecul_sa <- apply(molecul_followed,1,function(x,vect_sa){grep(x,vect_sa,ignore.case = TRUE)},vect_sa=sa_pesticide)

molecul_sa <- unique(pesticide_water_quanti$LbLongParamètre)[which(sapply(match_molecul_sa, FUN = function(x){!(is.integer(x) && length(x) == 0)}))]

pesticide_water_quanti <- pesticide_water_quanti[which(pesticide_water_quanti$LbLongParamètre %in% molecul_sa),]

### get data for metropole only

pesticide_water_station <- merge(pesticide_water_quanti,station_water_metro[,c("CoordXStationMesureEauxSurface","CoordYStationMesureEauxSurface","CdCommune","CdStationMesureEauxSurface")], by="CdStationMesureEauxSurface")



#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2013.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2014.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2015.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2016.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2017.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2018.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2019.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2020.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2021.rds")
#saveRDS(pesticide_water_station,"raw_data/naiade_all/pesticide_water_station_2022.rds")

to_bind1 <- readRDS("raw_data/naiade_all/pesticide_water_station_2013.rds")
to_bind1 <- data.frame(to_bind1,year=2013)
to_bind2 <- readRDS("raw_data/naiade_all/pesticide_water_station_2014.rds")
to_bind2 <- data.frame(to_bind2,year=2014)
to_bind3 <- readRDS("raw_data/naiade_all/pesticide_water_station_2015.rds")
to_bind3 <- data.frame(to_bind3,year=2015)
to_bind4 <- readRDS("raw_data/naiade_all/pesticide_water_station_2016.rds")
to_bind4 <- data.frame(to_bind4,year=2016)
to_bind5 <- readRDS("raw_data/naiade_all/pesticide_water_station_2017.rds")
to_bind5 <- data.frame(to_bind5,year=2017)
to_bind6 <- readRDS("raw_data/naiade_all/pesticide_water_station_2018.rds")
to_bind6 <- data.frame(to_bind6,year=2018)
to_bind7 <- readRDS("raw_data/naiade_all/pesticide_water_station_2019.rds")
to_bind7 <- data.frame(to_bind7,year=2019)
to_bind8 <- readRDS("raw_data/naiade_all/pesticide_water_station_2020.rds")
to_bind8 <- data.frame(to_bind8,year=2020)
to_bind9 <- readRDS("raw_data/naiade_all/pesticide_water_station_2021.rds")
to_bind9 <- data.frame(to_bind9,year=2021)
to_bind10 <- readRDS("raw_data/naiade_all/pesticide_water_station_2022.rds")
to_bind10 <- data.frame(to_bind10,year=2022)

pesticide_water_station_all <- rbind(to_bind1,to_bind2,to_bind3,to_bind4,to_bind5,
                                     to_bind6,to_bind7,to_bind8,to_bind9,to_bind10)

pesticide_water_station_all$LbStationMesureEauxSurface.y <- NULL
names(pesticide_water_station_all)[2] <- "LbStationMesureEauxSurface"

pesticide_water_station_all <- pesticide_water_station_all[which(!(pesticide_water_station_all$LbLongParamètre %in% c("Potassium","Calcium","Sodium",
                                                                                                                      "Sulfates","Ammonium","Cuivre"))),]
pesticide_water_station_all$RsAna <- as.numeric(pesticide_water_station_all$RsAna)


#saveRDS(pesticide_water_station_all,"raw_data/naiade_all/pesticide_water_station_all.rds")
pesticide_water_station_all <- readRDS("raw_data/naiade_all/pesticide_water_station_all.rds")

pesticide_water_station_simple <- pesticide_water_station_all[,c("CdStationMesureEauxSurface","RsAna","SymUniteMesure","LbLongParamètre","CoordXStationMesureEauxSurface",
                                                                 "CoordYStationMesureEauxSurface","year")]


# load geographical data for French communes from https://public.opendatasoft.com/explore/dataset/georef-france-commune-arrondissement-municipal-millesime/export/?disjunctive.reg_name&disjunctive.dep_name&disjunctive.arrdep_name&disjunctive.ze2020_name&disjunctive.bv2012_name&disjunctive.epci_name&disjunctive.ept_name&disjunctive.com_name&disjunctive.com_arm_name&disjunctive.com_arm_is_mountain_area&sort=year&location=6,46.97276,3.93311&basemap=jawg.light

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")

# bassin versant https://www.sandre.eaufrance.fr/atlas/srv/fre/catalog.search#/metadata/9002f47d-62d2-4bff-b95c-b1dc1b0bd319

bassin_versant <- st_read("raw_data/naiade_all/BassinVersantTopographique_FXX.gpkg")


## test with folpel

pesticide_water_folpel <- data.frame(pesticide_water_station_simple[which(pesticide_water_station_simple$LbLongParamètre == "Folpel"),] %>% group_by(CdStationMesureEauxSurface,CoordXStationMesureEauxSurface,CoordYStationMesureEauxSurface,SymUniteMesure) %>% summarize(qte=mean(RsAna, na.rm=TRUE)))


pesticide_water_folpel_sf <- st_as_sf(pesticide_water_folpel, crs = "EPSG:2154", coords = c("CoordXStationMesureEauxSurface", "CoordYStationMesureEauxSurface"))

fr <- st_transform(code_postal[which(!(code_postal$nom_region %in% c("GUYANE","MAYOTTE","GUADELOUPE","MARTINIQUE","REUNION"))),],crs = "EPSG:2154" ) 

ggplot() + geom_sf(data = fr) + 
  geom_sf(data = pesticide_water_folpel_sf, mapping = aes(col = qte)) +
  scale_color_gradientn(colors = sf.colors(20))

bassin_versant_fr <- st_transform(bassin_versant,crs = "EPSG:2154" ) 

ggplot() + geom_sf(data = bassin_versant_fr) + 
  geom_sf(data = pesticide_water_folpel_sf, mapping = aes(col = qte)) +
  scale_color_gradientn(colors = sf.colors(20))

bassin_versant_folpel <- st_join(bassin_versant_fr,pesticide_water_folpel_sf)
bassin_versant_folpel <- bassin_versant_folpel %>% mutate() %>% group_by(CdOH) %>%  summarise(qte_mean=mean(qte,na.rm=TRUE))

ggplot() + 
  geom_sf(data = bassin_versant_folpel, mapping = aes(fill = qte_mean)) +
  scale_fill_gradientn(colors = sf.colors(20), na.value = "transparent")


## test with glyphosate

pesticide_water_glyphosate <- data.frame(pesticide_water_station_simple[which(pesticide_water_station_simple$LbLongParamètre == "Glyphosate"),] %>% group_by(CdStationMesureEauxSurface,CoordXStationMesureEauxSurface,CoordYStationMesureEauxSurface,SymUniteMesure) %>% summarize(qte=mean(RsAna, na.rm=TRUE)))


pesticide_water_glyphosate_sf <- st_as_sf(pesticide_water_glyphosate, crs = "EPSG:2154", coords = c("CoordXStationMesureEauxSurface", "CoordYStationMesureEauxSurface"))

ggplot() + geom_sf(data = fr) + 
  geom_sf(data = pesticide_water_glyphosate_sf, mapping = aes(col = qte)) +
  scale_color_gradientn(colors = sf.colors(20))

ggplot() + geom_sf(data = bassin_versant_fr) + 
  geom_sf(data = pesticide_water_glyphosate_sf, mapping = aes(col = qte)) +
  scale_color_gradientn(colors = sf.colors(20))

bassin_versant_glyphosate <- st_join(bassin_versant_fr,pesticide_water_glyphosate_sf)
bassin_versant_glyphosate <- bassin_versant_glyphosate %>% mutate() %>% group_by(CdOH) %>%  summarise(qte_mean=mean(qte,na.rm=TRUE))

ggplot() + 
  geom_sf(data = bassin_versant_glyphosate, mapping = aes(fill = qte_mean)) +
  scale_fill_gradientn(colors = sf.colors(20), na.value = "transparent")
