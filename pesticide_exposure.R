# pesticide use
itt_pesticide_year <- readRDS("output/itt_pesticide_year.rds")
# pesticide air
df_sa_year_long <- readRDS("output/df_sa_year_long.rds")
# pesticide water
bassin_versant_all_year <- readRDS("output/bassin_versant_all_year.rds")

# mandatory report
report <- read.csv("raw_data/Redevance_year_2024.csv")
report$X <- NULL

substance_active <- read.csv2("raw_data/decisionamm-intrant-format-csv-20240710-utf8/substance_active_utf8.csv",header=T)


# unify column names according to substance_active

names(df_sa_year_long)[which(!(names(df_sa_year_long) %in% substance_active$Nom.substance.active))]

names(df_sa_year_long)[which(!(names(df_sa_year_long) %in% substance_active$Nom.substance.active))][-c(1:3)] <- c("Abamectin","Azoxystrobin","Bifenthrin","Bromoxynil","Captan",
                                                                                                                 "Chloridazon","Chlorpropham","Chlorthal-dimethyl","Chlortoluron","Clothianidin",
                                                                                                                 "Cyazofamid","Cyfluthrin","Fenhexamid","Fenpropidin","Fenpropimorph",  
                                                                                                                 "Flonicamid","Florasulam","Flumioxazin","Folpet","Imidacloprid",       
                                                                                                                 "Indoxacarb","Picoxystrobin","Propachlor","Prosulfocarb","Pyraclostrobin",     
                                                                                                                 "Thiacloprid","Thiram","Tri-allate","Trifloxystrobin","Trifluralin",       
                                                                                                                 "Ziram")

names(bassin_versant_all_year)[which(!(names(bassin_versant_all_year) %in% substance_active$Nom.substance.active))]

names(bassin_versant_all_year)[which(!(names(bassin_versant_all_year) %in% substance_active$Nom.substance.active))][-c(1:17,182)] <- c("Phoxim","Chlormephos","Cyfluthrin","Acephate","Phosmet",
                                                                                                                                      "Lambda-Cyhalothrin","Tolylfluanid","Dichlofluanid","Cypermethrin","Tri-allate",
                                                                                                                                      "Bifenox","Vinclozolin","Flumioxazin","Metazachlor","Tebuconazole",
                                                                                                                                      "Zinc","Pendimethalin","Benfluralin","Chlorpyrifos-methyl","Bifenthrin",
                                                                                                                                      "Bromoxynil","Captan","Diquat (dibromide)","Aclonifen","Alpha-Cypermethrin",
                                                                                                                                      "Lenacil","Thiram","Butralin","Difenoconazole","S-Metolachlor",
                                                                                                                                      "Metamitron","Chlortoluron","Metribuzin","Dimethenamid","Chloridazon",
                                                                                                                                      "Arsenic","Prosulfocarb","Dimethomorph","Chlorpropham","Terbutryn",
                                                                                                                                      "Fenpropidin","Dimethoate","Mesotrione","Carbetamide","Azoxystrobin",
                                                                                                                                      "Pyrimethanil","Mecoprop","Metalaxyl","Fenpropimorph","Mecoprop-P",
                                                                                                                                      "Pirimicarb","Alachlor","Carbendazim","Imidacloprid","Dinoterb",
                                                                                                                                      "Thiophanate-methyl","Kresoxim-methyl","Chlorpyrifos","Trifluralin","Dinoseb",             
                                                                                                                                      "Asulam","Methomyl","Metaldehyde","Picloram","Lufenuron",
                                                                                                                                      "Dichlorophen","Neburon","Phenmedipham","Picoxystrobin","Triadimenol",
                                                                                                                                      "Pyraclostrobin","Permethrin","Trifloxystrobin","Fenitrothion","Cycloxydim",
                                                                                                                                      "Oxydemeton-methyl","Propachlor","Methabenzthiazuron","Ametryn","Fer",
                                                                                                                                      "Triadimefon","Dimethylamin","Norflurazon","Fenuron","Pyridaben",
                                                                                                                                      "Imazamethabenz","Prometryne","Maleic hydrazide","Rotenone","Clofentezine",
                                                                                                                                      "Fluazifop-P","Pymetrozine","Fenazaquin","Fluridone","Metoxuron",
                                                                                                                                      "Tebufenpyrad","Haloxyfop","Mepronil","Metobromuron","Fenarimol",
                                                                                                                                      "Bendiocarb","Aldicarb","Benomyl","Thiocarb","Naptalam",
                                                                                                                                      "Chlorthal-dimethyl","Buprofezin","Desmetryne","Quintozene","Acifluorfen",
                                                                                                                                      "Deltamethrin","Dithianon","Oxyfluorfen","Chlorthiamid","EPTC (ethyl dipropylthiocarbamate)",
                                                                                                                                      "Methidathion","Fenpropathrin","Omethoate","Carbophenothion","Fluor",
                                                                                                                                      "Folpet","Pyriproxyfen","Propaquizafop","Flamprop","Propham",
                                                                                                                                      "Sethoxydim","Cyhalothrin","Terbufos","Fenvalerate","Demeton",
                                                                                                                                      "Indoxacarb","Bioresmethrin","Chinomethionat","Tralomethrin","Fenizon",
                                                                                                                                      "Tetrachlorvinphos","Acibenzolar-S-methyl","Formetanate","Acrinathrin","Clothianidin",       
                                                                                                                                      "Aluminium","Mancozeb","Cyazofamid","Prohexadione","Sulfosat",
                                                                                                                                      "Ziram","Cinidon-ethyl","Mevinphos","Difenamid","Thiometon",
                                                                                                                                      "Proquinazid","Zineb","Maneb","Fluxapyroxad","Pirimiphos-ethyl",
                                                                                                                                      "Phenols","Chlorates","Bromure","Cyflufenamid","Sulphur",
                                                                                                                                      "Trichloronate","Tau-Fluvalinate","Mefentrifluconazole","Fluconazol")


names(itt_pesticide_year) <- gsub('\\.', ' ', names(itt_pesticide_year))
foo <- function(x){
  paste(toupper(substring(x, 1, 1)),
        tolower(substring(x, 2, nchar(x))),
        sep = "")}

names(itt_pesticide_year)[-c(349)] <- foo(names(itt_pesticide_year)[-c(349)])
names(itt_pesticide_year)[which(!(names(itt_pesticide_year) %in% substance_active$Nom.substance.active))]

names(itt_pesticide_year)[which(!(names(itt_pesticide_year) %in% substance_active$Nom.substance.active))][-c(1,2,206)] <- c("(E,Z)-7,9-Dodecadien-1-yl Acetate","Z-13-hexadecen-11-yn-1-yl acetate","Straight Chain Lepidopteran Pheromones","1,3-Dichloropropene","2,4-D","2,4-DB",
                                                                                                                           "MCPA","MCPB","6-Benzyladenine","8-Hydroxyquinoline incl. oxyquinoleine","Abamectin","Acetamiprid",
                                                                                                                           "Straight Chain Lepidopteran Pheromones","Acetate de z 8 dodecenyle","Acibenzolar-S-methyl","Acetic acid","1-Naphtylacetic acid","Gibberellic acid",
                                                                                                                           "Acide octanoique","Fatty acids","Potassium phosphonates","Acrinathrin","Naphtylacetic acid hydrazide","Alphamethrine",
                                                                                                                           "Ametoctradin","Aminotriazole","Asulam","Azadirachtin","Azoxystrobin","Bacillus pumilus QST 2808",
                                                                                                                           "Bacillus thuringiensis serotype 3a 3b","Bacillus thuringiensis sérotype h 7","Bacillus thuringiensis subsp. aizawai strain ABTS-1857","Beflubutamid","Benfluralin","Benfuracarb",
                                                                                                                           "Bensulfuron","Beta-Cyfluthrin","Bicarbonate de potassium", "Bifenthrin","Bromoxynil","Buprofezin",
                                                                                                                           "Piperonyl butoxide","Captan","Carfentrazone-ethyl","Chlorates","Chloridazon","Chlormequat",
                                                                                                                           "Chlorpropham","Chlorpyrifos","Chlorpyrifos-methyl","Chlorthal-dimethyl","Choline chloride","Cinidon-ethyl",
                                                                                                                           "Sintofen","Clethodim","Clopyralid","Clothianidin","COS-OGA","Copper compounds",
                                                                                                                           "Cuivre de l oxychlorure de cuivre","Cuivre de l oxyde cuivreux","Cuivre du sulfate de cuivre","Cuivre du sulfate tetracuivrique et tricalcique","Cuivre du sulfate tribasique","Cuivre du tallate de cuivre",
                                                                                                                           "Cyanamide (H & Ca cyanamide)","Cyazofamid","Cycloxydim","Cydia pomonella Granulovirus (CpGV)","Cyfluthrin","Cyhalofop-butyl",
                                                                                                                           "Cypermethrin","Cyprodinil","1-Decanol","Deltamethrin","Didecyldimethylammonium chloride","Dichlorprop-P",
                                                                                                                           "Diclofop","Diflufenican","Dimethachlor","Dimethenamid","Dimethenamid-P","Dimethomorph",
                                                                                                                           "Diquat (dibromide)","Emamectin","Esters methyliques d'acides gras","Esters methyliques d acides gras c16 c18 et c18 insatures","Garlic extract","Fenugrec extract",
                                                                                                                           "Blood meal","Fenbutatin oxide","Fenoxaprop-P","Fenoxycarb","Fenpicoxamid","Fenpropidin",
                                                                                                                           "Fenpropimorph","Iron sulphate","Flonicamid","Florasulam","Florpyrauxifen-benzyl","Fluazifop-P",
                                                                                                                           "Flumioxazin","Flupyrsulfuron-methyl","Fluroxypyr","Folpet","Formetanate","Fosetyl",
                                                                                                                           "Gamma-cyhalothrin","Gibberellins","Glufosinate","Halosulfuron methyl","Heptamethyltrisiloxane modifie polyalkyleneoxide","Bone Oil",
                                                                                                                           "Paraffin oils","Huile de vaseline","Orange oil","Huile minerale paraffinique","Maleic hydrazide","Imidacloprid",
                                                                                                                           "Indoxacarb","Ioxynil","Isofetamid","Isoxadifen-ethyl","Kaolin","Kresoxim-methyl",
                                                                                                                           "Lambda-Cyhalothrin","Laminarin","Lenacil","Mancozeb","Mandestrobin","Mandipropamid",
                                                                                                                           "Maneb","Mecoprop-P","Mefenpyr","Metalaxyl-M","Metam","Metamitron",
                                                                                                                           "Metazachlor","Methiocarb","Metiram","Metirame zinc","Metribuzin","Metsulfuron-methyl",#
                                                                                                                           "Milbemectin","Oxathiapiprolin","Oxyfluorfen","Pendimethalin","Penoxsulam","Pethoxamid",
                                                                                                                           "Phenmedipham","Ferric phosphate","Disodium phosphonate","Potassium phosphonates","Aluminium phosphide","Zinc phosphide",
                                                                                                                           "Picloram","Picoxystrobin","Pepper","Prochloraz","Prohexadione","Propachlor",
                                                                                                                           "Propamocarb","Propamocarbe hcl","Propoxycarbazone","Prosulfocarb","Pyraclostrobin","Pyraflufen-ethyl",
                                                                                                                           "Pyrethrins","Pyridaben","Pyrimicarb","Pyriproxyfen","Quinoxyfen","Quizalofop-P-ethyl",
                                                                                                                           "S-Metolachlor","Fatty acids: potassium salt - tall oil fatty acid","Sels de potassium d acides gras c8 c18 ","Sulphur","Soufre pour pulverisation micronise ","Soufre sublime",
                                                                                                                           "Soufre triture","Soufre triture ventile","Sulfate de fer sulfate ferreux heptahydrate ","Tau-Fluvalinate","Tefluthrin","Thiacloprid",
                                                                                                                           "Thiencarbazone","Thifensulfuron-methyl","Ammonium thiocyanate","Thiodicarb","Thiophanate-methyl","Thiram",
                                                                                                                           "Tri-allate","Tribenuron","Trichoderma asperellum TV1","Trifloxystrobin","Trifluralin","Triflusulfuron",
                                                                                                                           "Trinexapac","Agrotis segetum granulosis virus","Zucchini yellow mosaic virus","Zeta-Cypermethrin","Ziram")

itt_pesticide_year$`Copper compounds` <- apply(itt_pesticide_year[,c("Copper compounds","Cuivre de l oxychlorure de cuivre","Cuivre de l oxyde cuivreux","Cuivre du sulfate de cuivre","Cuivre du sulfate tribasique","Cuivre du tallate de cuivre","Cuivre du sulfate tetracuivrique et tricalcique")],1,function(x){x<-unlist(x[1:7]); return(sum(x, na.rm=TRUE))})
itt_pesticide_year$`Cuivre de l oxychlorure de cuivre` <- itt_pesticide_year$`Cuivre de l oxyde cuivreux` <- itt_pesticide_year$`Cuivre du sulfate de cuivre` <- 
  itt_pesticide_year$`Cuivre du sulfate tribasique` <- itt_pesticide_year$`Cuivre du tallate de cuivre` <- itt_pesticide_year$`Cuivre du sulfate tetracuivrique et tricalcique` <- NULL

itt_pesticide_year$Sulphur <- apply(itt_pesticide_year[,c("Sulphur","Soufre pour pulverisation micronise ","Soufre sublime","Soufre triture","Soufre triture ventile")],1,function(x){x<-unlist(x[1:5]); return(sum(x, na.rm=TRUE))})
itt_pesticide_year$`Soufre pour pulverisation micronise ` <- itt_pesticide_year$`Soufre sublime` <- itt_pesticide_year$`Soufre triture` <- itt_pesticide_year$`Soufre triture ventile` <- NULL

itt_pesticide_year$`Iron sulphate` <- apply(itt_pesticide_year[,c("Iron sulphate","Sulfate de fer sulfate ferreux heptahydrate ")],1,function(x){x<-unlist(x[1:2]); return(sum(x, na.rm=TRUE))})
itt_pesticide_year$`Sulfate de fer sulfate ferreux heptahydrate ` <-  NULL


# focus on substances mandatory to report

substance_active_unique <- read.csv2("raw_data/decisionamm-intrant-format-csv-20240710-utf8/substance_active_utf8_uniqueCAS.csv",header=T)

mandatory_2013 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2013)])]
mandatory_2014 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2014)])]
mandatory_2015 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2015)])]
mandatory_2016 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2016)])]
mandatory_2017 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2017)])]
mandatory_2018 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2018)])]
mandatory_2019 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2019)])]
mandatory_2020 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2020)])]
mandatory_2021 <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Numero.CAS %in% report$CAS[which(report$annee==2021)])]

mandatory_all <- substance_active_unique$Nom.substance.active[which(substance_active_unique$Nom.substance.active %in% mandatory_2013 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2014 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2015 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2016 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2017 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2018 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2019 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2020 &
                                              substance_active_unique$Nom.substance.active %in% mandatory_2021)]

pesticide_soil <- itt_pesticide_year[,c(1,2,which(names(itt_pesticide_year) %in% mandatory_all))]
pesticide_air <- df_sa_year_long[,c(1,2,which(names(df_sa_year_long) %in% mandatory_all))]
pesticide_water <- bassin_versant_all_year[,c(1,2,which(names(bassin_versant_all_year) %in% mandatory_all))]


### T T+ CMR
pesticide_pre_itt <- readRDS("output/pesticide_pre_itt.rds")
sa_class <- unique(pesticide_pre_itt[c('substance', 'classification')])
sa_TTCMR <- sa_class$substance[which(sa_class$classification=="T, T+, CMR")]
sa_TTCMR <- foo(sort(sa_TTCMR))
sa_TTCMR[which(!(sa_TTCMR %in% substance_active$Nom.substance.active))] <- c("1,3-Dichloropropene","6-Benzyladenine","Abamectin",
                                                                             "Alphamethrin","Aminotriazol","Azoxystrobin",
                                                                             "Benfluralin","Benfuracarb","Beta-Cyfluthrin",
                                                                             "Bifenthrin","Bromoxynil","Captan",
                                                                             "Chlorpropham","Chlorpyrifos","Sintofen",
                                                                             "Copper compounds","Cuivre de l'oxychlorure de cuivre","Cuivre du tallate de cuivre",
                                                                             "Cycloxydim","Cyfluthrin","Deltamethrin",
                                                                             "Diquat (dibromide)","Emamectin","Fenbutatin oxide",
                                                                             "Fenoxycarb","Fenpropimorph","Fluazifop-P",
                                                                             "Flumioxazin","Folpet","Formetanate",
                                                                             "Gamma-cyhalothrin","Glufosinate","Indoxacarb",
                                                                             "Ioxynil","Lambda-Cyhalothrin","Lenacil",
                                                                             "Mancozeb","Maneb","Metazachlor",
                                                                             "Methiocarb","Oxyfluorfen","Aluminium phosphide",
                                                                             "Pyraclostrobin","Pyridaben","Pirimicarb",
                                                                             "Tefluthrin","Thiacloprid","Thiencarbazone",
                                                                             "Triflusulfuron","Zeta-Cypermethrin","Ziram")

pesticide_soil_CMR <- itt_pesticide_year[,c(1,2,which(names(itt_pesticide_year) %in% mandatory_all & names(itt_pesticide_year) %in% sa_TTCMR))]
pesticide_air_CMR <- df_sa_year_long[,c(1,2,which(names(df_sa_year_long) %in% mandatory_all & names(df_sa_year_long) %in% sa_TTCMR))]
pesticide_water_CMR <- bassin_versant_all_year[,c(1,2,which(names(bassin_versant_all_year) %in% mandatory_all & names(bassin_versant_all_year) %in% sa_TTCMR))]

saveRDS(pesticide_soil_CMR,"output/pesticide_soil_CMR.rds")
saveRDS(pesticide_air_CMR,"output/pesticide_air_CMR.rds")
saveRDS(pesticide_water_CMR,"output/pesticide_water_CMR.rds")


average_soil_CMR <- pesticide_soil_CMR
st_geometry(average_soil_CMR) <- NULL
average_soil_CMR <- apply(average_soil_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_soil_CMR$all_itt <- average_soil_CMR
pesticide_soil_CMR_average <- st_as_sf(data.frame(pesticide_soil_CMR %>% group_by(Postal_code) %>% summarise(mean_itt = mean(all_itt, na.rm=T))))

ggplot(pesticide_soil_CMR_average)+
  geom_sf(aes(fill=log(mean_itt+1)), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_minimal() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))

average_air_CMR <- pesticide_air_CMR
st_geometry(average_air_CMR) <- NULL
average_air_CMR <- apply(average_air_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
average_air_CMR[average_air_CMR<0] <- 0
pesticide_air_CMR$Concentration_total <- average_air_CMR
pesticide_air_CMR_average <- st_as_sf(data.frame(data.frame(pesticide_air_CMR) %>% group_by(id,geometry) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))

ggplot(pesticide_air_CMR_average)+
  geom_sf(aes(fill=log(mean_concentration+1)), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_minimal()

average_water_CMR <- pesticide_water_CMR
st_geometry(average_water_CMR) <- NULL
average_water_CMR <- apply(average_water_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_water_CMR$Concentration_total <- average_water_CMR
pesticide_water_CMR_average <- st_as_sf(data.frame(pesticide_water_CMR %>% group_by(CdOH) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))

ggplot(pesticide_water_CMR_average)+
  geom_sf(aes(fill=log(mean_concentration+1)), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_minimal()

#saveRDS(pesticide_soil_CMR_average,"output/pesticide_soil_CMR_average.rds")
pesticide_soil_CMR_average <- readRDS("output/pesticide_soil_CMR_average.rds")
#saveRDS(pesticide_air_CMR_average,"output/pesticide_air_CMR_average.rds")
pesticide_air_CMR_average <- readRDS("output/pesticide_air_CMR_average.rds")
#saveRDS(pesticide_water_CMR_average,"output/pesticide_water_CMR_average.rds")
pesticide_water_CMR_average <- readRDS("output/pesticide_water_CMR_average.rds")

# rescale values

pesticide_soil_CMR_average$mean_itt[which(is.infinite(pesticide_soil_CMR_average$mean_itt))] <- NA
threshold_soil <- quantile(pesticide_soil_CMR_average$mean_itt,0.995 ,na.rm = TRUE)
pesticide_soil_CMR_average$mean_itt[which(pesticide_soil_CMR_average$mean_itt>threshold_soil)] <- threshold_soil
pesticide_soil_CMR_average$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average$mean_itt)
ggplot(pesticide_soil_CMR_average)+
  geom_sf(aes(fill=mean_itt), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))

ggsave("output/figure_sa_use.png",
       width = 6,
       height = 6,
       dpi = 400)

threshold_air <- quantile(pesticide_air_CMR_average$mean_concentration,0.995)
pesticide_air_CMR_average$mean_concentration[which(pesticide_air_CMR_average$mean_concentration>threshold_air)] <- threshold_air
pesticide_air_CMR_average$mean_concentration_scale <- scales::rescale(pesticide_air_CMR_average$mean_concentration)
ggplot(pesticide_air_CMR_average)+
  geom_sf(aes(fill=mean_concentration), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggsave("output/figure_sa_air.png",
       width = 6,
       height = 6,
       dpi = 400)

threshold_water <- quantile(pesticide_water_CMR_average$mean_concentration,0.995)
pesticide_water_CMR_average$mean_concentration[which(pesticide_water_CMR_average$mean_concentration>threshold_water)] <- threshold_water
pesticide_water_CMR_average$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average$mean_concentration)
ggplot(pesticide_water_CMR_average)+
  geom_sf(aes(fill=mean_concentration), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggsave("output/figure_sa_water.png",
       width = 6,
       height = 6,
       dpi = 400)


# combine maps

pesticide_CMR_all <- pesticide_air_CMR_average
pesticide_soil_CMR_average <- st_transform(pesticide_soil_CMR_average,st_crs(pesticide_CMR_all))
pesticide_water_CMR_average <- st_transform(pesticide_water_CMR_average,st_crs(pesticide_CMR_all))

pesticide_CMR_all_df <- st_intersection(pesticide_CMR_all,pesticide_soil_CMR_average[,c("mean_itt_scale")])
pesticide_CMR_all_df$area <- as.numeric(st_area(pesticide_CMR_all_df))
pesticide_CMR_all_df$mean_itt_scale_area <- pesticide_CMR_all_df$mean_itt_scale*pesticide_CMR_all_df$area
pesticide_CMR_all_df <- data.frame(data.frame(pesticide_CMR_all_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_all$area <- as.numeric(st_area(pesticide_CMR_all))
pesticide_CMR_all$mean_itt_scale <- pesticide_CMR_all_df$sum_itt_area/pesticide_CMR_all$area

pesticide_CMR_all_df <- st_intersection(pesticide_CMR_all[,c("id")],pesticide_water_CMR_average[,c("mean_concentration_scale")])
pesticide_CMR_all_df$area <- as.numeric(st_area(pesticide_CMR_all_df))
pesticide_CMR_all_df$mean_concentration_scale_area <- pesticide_CMR_all_df$mean_concentration_scale*pesticide_CMR_all_df$area
pesticide_CMR_all_df <- data.frame(data.frame(pesticide_CMR_all_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_all_df_toadd <- data.frame(id=which(!(pesticide_CMR_all$id %in% pesticide_CMR_all_df$id)),sum_concentration_area=NA)
pesticide_CMR_all_df <- rbind(pesticide_CMR_all_df,pesticide_CMR_all_df_toadd)
pesticide_CMR_all_df <- with(pesticide_CMR_all_df, pesticide_CMR_all_df[order(id),])
pesticide_CMR_all$mean_concentration_scale_water <- pesticide_CMR_all_df$sum_concentration_area/pesticide_CMR_all$area

pesticide_CMR_all$all_pesticide_exposure <- pesticide_CMR_all$mean_concentration_scale + pesticide_CMR_all$mean_itt_scale + pesticide_CMR_all$mean_concentration_scale_water
ggplot(pesticide_CMR_all)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggsave("output/figure_sa_combined.png",
       width = 6,
       height = 6,
       dpi = 400)

pesticide_CMR_all$mean_concentration <- pesticide_CMR_all$area <- NULL
pesticide_soil_CMR_average <- pesticide_soil_CMR_average[which(as.numeric(str_sub(pesticide_soil_CMR_average$Postal_code,1,2)) < 96),]

# save all

#saveRDS(pesticide_CMR_all,"output/pesticide_CMR_all.rds")
st_write(pesticide_CMR_all,dsn="output/pesticide_CMR_all.gpkg")
st_write(pesticide_soil_CMR_average,dsn="output/pesticide_CMR_soil.gpkg")
st_write(pesticide_air_CMR_average,dsn="output/pesticide_CMR_air.gpkg")
st_write(pesticide_water_CMR_average,dsn="output/pesticide_CMR_water.gpkg")


# technical valisation with adonis IFT from solagro https://solagro.org/nos-domaines-d-intervention/agroecologie/carte-pesticides-adonis

adonis_df <- read.csv2("/home/rigal/Documents/pesticide/raw_data/pack_solagro_adonis_2021/pack_solagro_adonis_2020-2021_csv_utf8/fr-324510908-adonis-ift-2021-v31082023.csv")
adonis_df$insee_com <- str_pad(adonis_df$insee_com, 5, pad = "0")
  
code_postal <- sf::st_read("raw_data/georef-france-commune-arrondissement-municipal-millesime.geojson")
code_postal_2024 <- code_postal[which(code_postal$year==2024),]
code_postal_metro <- code_postal_2024[which(!(code_postal_2024$reg_name %in% c("Guadeloupe","Martinique","La Réunion","Mayotte","Île de Clipperton",
                                                                                 "Guyane","Saint-Pierre-et-Miquelon","Terres australes et antarctiques françaises",
                                                                                 "Wallis et Futuna","Saint-Martin","Saint-Barthélemy"))),]
code_postal_metro <- st_transform(code_postal_metro,crs="EPSG:2154")

#saveRDS(code_postal_metro,"output/code_postal_metro.rds")
code_postal_metro <- readRDS("output/code_postal_metro.rds")
code_postal_metro <- code_postal_metro[,c("com_code")]
code_postal_metro$com_code <- unlist(code_postal_metro$com_code)

adonis_sf <- merge(code_postal_metro,adonis_df, by.x="com_code",by.y="insee_com")
adonis_sf$ift_t <- as.numeric(adonis_sf$ift_t)

ggplot(adonis_sf)+
  geom_sf(aes(fill=ift_t), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_void()
