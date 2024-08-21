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

names(df_sa_year_long)[which(!(names(df_sa_year_long) %in% substance_active$Nom.substance.active))][-c(1:4)] <- c("Abamectin","Azoxystrobin","Bifenthrin","Bromoxynil","Captan",
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
                                                                                                                           "Cintofen","Clethodim","Clopyralid","Clothianidin","COS-OGA","Copper compounds",
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

pesticide_soil <- itt_pesticide_year[,which(names(itt_pesticide_year) %in% mandatory_all)]
pesticide_air <- df_sa_year_long[,which(names(df_sa_year_long) %in% mandatory_all)]
pesticide_water <- bassin_versant_all_year[,which(names(bassin_versant_all_year) %in% mandatory_all)]
