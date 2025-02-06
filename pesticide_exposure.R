# pesticide use
itt_pesticide_year <- readRDS("output/itt_pesticide_year.rds")
qsa_pesticide_year <- readRDS("output/qsa_pesticide_year.rds")
itt_pesticide_year_com <- readRDS("output/itt_pesticide_year_com.rds")
qsa_pesticide_year_com <- readRDS("output/qsa_pesticide_year_com.rds")
qsa_dhsa_pesticide_year_com <- readRDS("output/qsa_dhsa_pesticide_year_com.rds")
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

names(df_sa_year_long)[which(!(names(df_sa_year_long) %in% substance_active$Nom.substance.active))][-c(1:3)] <- c("MCPA","Abamectin","Acetamiprid","1,2,4-triazole","Azoxystrobin",
                                                                                                                  "Bifenthrin","Bromoxynil","Captan","Chloridazon","Chlorpropham",
                                                                                                                  "Chlorthal-dimethyl","Clothianidin","Cyazofamid","Cyfluthrin","Cypermethrin",
                                                                                                                  "Deltamethrin","Diclofop","Diflufenican","Dimethenamid-P","Dimethomorph",
                                                                                                                  "Fenoxycarb","Fenpropidin","Fenpropimorph","Flonicamid","Florasulam",
                                                                                                                  "Flumioxazin","Folpet","Imidacloprid","Indoxacarb","Ioxynil",
                                                                                                                  "Mandipropamid","Metamitron","Metazachlor","Metribuzin","Oxyfluorfen",
                                                                                                                  "Pendimethalin","Permethrin","Phenmedipham","Picoxystrobin","Propachlor",
                                                                                                                  "Prosulfocarb","Pyraclostrobin","Pyrethrin","Pirimicarb","Tefluthrin",
                                                                                                                  "Thiacloprid","Thiodicarb","Thiram","Tri-allate","Trifloxystrobin",
                                                                                                                  "Trifluralin","Ziram")

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


names(qsa_pesticide_year) <- gsub('\\.', ' ', names(qsa_pesticide_year))
names(qsa_pesticide_year)[-c(349)] <- foo(names(qsa_pesticide_year)[-c(349)])
names(qsa_pesticide_year)[which(!(names(qsa_pesticide_year) %in% substance_active$Nom.substance.active))]

names(qsa_pesticide_year)[which(!(names(qsa_pesticide_year) %in% substance_active$Nom.substance.active))][-c(1,2,206)] <- c("(E,Z)-7,9-Dodecadien-1-yl Acetate","Z-13-hexadecen-11-yn-1-yl acetate","Straight Chain Lepidopteran Pheromones","1,3-Dichloropropene","2,4-D","2,4-DB",
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

qsa_pesticide_year$`Copper compounds` <- apply(qsa_pesticide_year[,c("Copper compounds","Cuivre de l oxychlorure de cuivre","Cuivre de l oxyde cuivreux","Cuivre du sulfate de cuivre","Cuivre du sulfate tribasique","Cuivre du tallate de cuivre","Cuivre du sulfate tetracuivrique et tricalcique")],1,function(x){x<-unlist(x[1:7]); return(sum(x, na.rm=TRUE))})
qsa_pesticide_year$`Cuivre de l oxychlorure de cuivre` <- qsa_pesticide_year$`Cuivre de l oxyde cuivreux` <- qsa_pesticide_year$`Cuivre du sulfate de cuivre` <- 
  qsa_pesticide_year$`Cuivre du sulfate tribasique` <- qsa_pesticide_year$`Cuivre du tallate de cuivre` <- qsa_pesticide_year$`Cuivre du sulfate tetracuivrique et tricalcique` <- NULL

qsa_pesticide_year$Sulphur <- apply(qsa_pesticide_year[,c("Sulphur","Soufre pour pulverisation micronise ","Soufre sublime","Soufre triture","Soufre triture ventile")],1,function(x){x<-unlist(x[1:5]); return(sum(x, na.rm=TRUE))})
qsa_pesticide_year$`Soufre pour pulverisation micronise ` <- qsa_pesticide_year$`Soufre sublime` <- qsa_pesticide_year$`Soufre triture` <- qsa_pesticide_year$`Soufre triture ventile` <- NULL

qsa_pesticide_year$`Iron sulphate` <- apply(qsa_pesticide_year[,c("Iron sulphate","Sulfate de fer sulfate ferreux heptahydrate ")],1,function(x){x<-unlist(x[1:2]); return(sum(x, na.rm=TRUE))})
qsa_pesticide_year$`Sulfate de fer sulfate ferreux heptahydrate ` <-  NULL


names(itt_pesticide_year_com) <- gsub('\\.', ' ', names(itt_pesticide_year_com))
names(itt_pesticide_year_com)[-c(349:350)] <- foo(names(itt_pesticide_year_com)[-c(349:350)])
names(itt_pesticide_year_com)[which(!(names(itt_pesticide_year_com) %in% substance_active$Nom.substance.active))]

names(itt_pesticide_year_com)[which(!(names(itt_pesticide_year_com) %in% substance_active$Nom.substance.active))][-c(1,2,206:207)] <- c("(E,Z)-7,9-Dodecadien-1-yl Acetate","Z-13-hexadecen-11-yn-1-yl acetate","Straight Chain Lepidopteran Pheromones","1,3-Dichloropropene","2,4-D","2,4-DB",
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

itt_pesticide_year_com$`Copper compounds` <- apply(itt_pesticide_year_com[,c("Copper compounds","Cuivre de l oxychlorure de cuivre","Cuivre de l oxyde cuivreux","Cuivre du sulfate de cuivre","Cuivre du sulfate tribasique","Cuivre du tallate de cuivre","Cuivre du sulfate tetracuivrique et tricalcique")],1,function(x){x<-unlist(x[1:7]); return(sum(x, na.rm=TRUE))})
itt_pesticide_year_com$`Cuivre de l oxychlorure de cuivre` <- itt_pesticide_year_com$`Cuivre de l oxyde cuivreux` <- itt_pesticide_year_com$`Cuivre du sulfate de cuivre` <- 
  itt_pesticide_year_com$`Cuivre du sulfate tribasique` <- itt_pesticide_year_com$`Cuivre du tallate de cuivre` <- itt_pesticide_year_com$`Cuivre du sulfate tetracuivrique et tricalcique` <- NULL

itt_pesticide_year_com$Sulphur <- apply(itt_pesticide_year_com[,c("Sulphur","Soufre pour pulverisation micronise ","Soufre sublime","Soufre triture","Soufre triture ventile")],1,function(x){x<-unlist(x[1:5]); return(sum(x, na.rm=TRUE))})
itt_pesticide_year_com$`Soufre pour pulverisation micronise ` <- itt_pesticide_year_com$`Soufre sublime` <- itt_pesticide_year_com$`Soufre triture` <- itt_pesticide_year_com$`Soufre triture ventile` <- NULL

itt_pesticide_year_com$`Iron sulphate` <- apply(itt_pesticide_year_com[,c("Iron sulphate","Sulfate de fer sulfate ferreux heptahydrate ")],1,function(x){x<-unlist(x[1:2]); return(sum(x, na.rm=TRUE))})
itt_pesticide_year_com$`Sulfate de fer sulfate ferreux heptahydrate ` <-  NULL


names(qsa_pesticide_year_com) <- gsub('\\.', ' ', names(qsa_pesticide_year_com))
names(qsa_pesticide_year_com)[-c(349:350)] <- foo(names(qsa_pesticide_year_com)[-c(349:350)])
names(qsa_pesticide_year_com)[which(!(names(qsa_pesticide_year_com) %in% substance_active$Nom.substance.active))]

names(qsa_pesticide_year_com)[which(!(names(qsa_pesticide_year_com) %in% substance_active$Nom.substance.active))][-c(1,2,206:207)] <- c("(E,Z)-7,9-Dodecadien-1-yl Acetate","Z-13-hexadecen-11-yn-1-yl acetate","Straight Chain Lepidopteran Pheromones","1,3-Dichloropropene","2,4-D","2,4-DB",
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

qsa_pesticide_year_com$`Copper compounds` <- apply(qsa_pesticide_year_com[,c("Copper compounds","Cuivre de l oxychlorure de cuivre","Cuivre de l oxyde cuivreux","Cuivre du sulfate de cuivre","Cuivre du sulfate tribasique","Cuivre du tallate de cuivre","Cuivre du sulfate tetracuivrique et tricalcique")],1,function(x){x<-unlist(x[1:7]); return(sum(x, na.rm=TRUE))})
qsa_pesticide_year_com$`Cuivre de l oxychlorure de cuivre` <- qsa_pesticide_year_com$`Cuivre de l oxyde cuivreux` <- qsa_pesticide_year_com$`Cuivre du sulfate de cuivre` <- 
  qsa_pesticide_year_com$`Cuivre du sulfate tribasique` <- qsa_pesticide_year_com$`Cuivre du tallate de cuivre` <- qsa_pesticide_year_com$`Cuivre du sulfate tetracuivrique et tricalcique` <- NULL

qsa_pesticide_year_com$Sulphur <- apply(qsa_pesticide_year_com[,c("Sulphur","Soufre pour pulverisation micronise ","Soufre sublime","Soufre triture","Soufre triture ventile")],1,function(x){x<-unlist(x[1:5]); return(sum(x, na.rm=TRUE))})
qsa_pesticide_year_com$`Soufre pour pulverisation micronise ` <- qsa_pesticide_year_com$`Soufre sublime` <- qsa_pesticide_year_com$`Soufre triture` <- qsa_pesticide_year_com$`Soufre triture ventile` <- NULL

qsa_pesticide_year_com$`Iron sulphate` <- apply(qsa_pesticide_year_com[,c("Iron sulphate","Sulfate de fer sulfate ferreux heptahydrate ")],1,function(x){x<-unlist(x[1:2]); return(sum(x, na.rm=TRUE))})
qsa_pesticide_year_com$`Sulfate de fer sulfate ferreux heptahydrate ` <-  NULL


names(qsa_dhsa_pesticide_year_com) <- gsub('\\.', ' ', names(qsa_dhsa_pesticide_year_com))
names(qsa_dhsa_pesticide_year_com)[-c(353:354)] <- foo(names(qsa_dhsa_pesticide_year_com)[-c(353:354)])
names(qsa_dhsa_pesticide_year_com)[which(!(names(qsa_dhsa_pesticide_year_com) %in% substance_active$Nom.substance.active))]

names(qsa_dhsa_pesticide_year_com)[which(!(names(qsa_dhsa_pesticide_year_com) %in% substance_active$Nom.substance.active))][-c(1:6,210:211)] <- c("(E,Z)-7,9-Dodecadien-1-yl Acetate","Z-13-hexadecen-11-yn-1-yl acetate","Straight Chain Lepidopteran Pheromones","1,3-Dichloropropene","2,4-D","2,4-DB",
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

qsa_dhsa_pesticide_year_com$`Copper compounds` <- apply(qsa_dhsa_pesticide_year_com[,c("Copper compounds","Cuivre de l oxychlorure de cuivre","Cuivre de l oxyde cuivreux","Cuivre du sulfate de cuivre","Cuivre du sulfate tribasique","Cuivre du tallate de cuivre","Cuivre du sulfate tetracuivrique et tricalcique")],1,function(x){x<-unlist(x[1:7]); return(sum(x, na.rm=TRUE))})
qsa_dhsa_pesticide_year_com$`Cuivre de l oxychlorure de cuivre` <- qsa_dhsa_pesticide_year_com$`Cuivre de l oxyde cuivreux` <- qsa_dhsa_pesticide_year_com$`Cuivre du sulfate de cuivre` <- 
  qsa_dhsa_pesticide_year_com$`Cuivre du sulfate tribasique` <- qsa_dhsa_pesticide_year_com$`Cuivre du tallate de cuivre` <- qsa_dhsa_pesticide_year_com$`Cuivre du sulfate tetracuivrique et tricalcique` <- NULL

qsa_dhsa_pesticide_year_com$Sulphur <- apply(qsa_dhsa_pesticide_year_com[,c("Sulphur","Soufre pour pulverisation micronise ","Soufre sublime","Soufre triture","Soufre triture ventile")],1,function(x){x<-unlist(x[1:5]); return(sum(x, na.rm=TRUE))})
qsa_dhsa_pesticide_year_com$`Soufre pour pulverisation micronise ` <- qsa_dhsa_pesticide_year_com$`Soufre sublime` <- qsa_dhsa_pesticide_year_com$`Soufre triture` <- qsa_dhsa_pesticide_year_com$`Soufre triture ventile` <- NULL

qsa_dhsa_pesticide_year_com$`Iron sulphate` <- apply(qsa_dhsa_pesticide_year_com[,c("Iron sulphate","Sulfate de fer sulfate ferreux heptahydrate ")],1,function(x){x<-unlist(x[1:2]); return(sum(x, na.rm=TRUE))})
qsa_dhsa_pesticide_year_com$`Sulfate de fer sulfate ferreux heptahydrate ` <-  NULL

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

mandatory_all_CAS <- substance_active_unique[which(substance_active_unique$Nom.substance.active %in% mandatory_all),]
mandatory_all_CAS$Etat.d.autorisation <- mandatory_all_CAS$Variant <- NULL
names(mandatory_all_CAS) <- c("active_substance","CAS_number")

write.csv2(mandatory_all_CAS, "output/Active_substance_to_report.csv", row.names = FALSE)

#pesticide_soil <- itt_pesticide_year[,c(1,2,which(names(itt_pesticide_year) %in% mandatory_all))]
pesticide_soil <- qsa_dhsa_pesticide_year_com[,c(1,2,which(names(qsa_dhsa_pesticide_year_com) %in% mandatory_all))]
pesticide_soil_qsa <- qsa_pesticide_year_com[,c(1,2,which(names(qsa_pesticide_year_com) %in% mandatory_all))]
pesticide_soil_com <- itt_pesticide_year_com[,c(1,2,which(names(itt_pesticide_year_com) %in% mandatory_all))]
pesticide_air <- df_sa_year_long[,c(1,2,which(names(df_sa_year_long) %in% mandatory_all))]
pesticide_water <- bassin_versant_all_year[,c(1,2,which(names(bassin_versant_all_year) %in% mandatory_all))]

names(pesticide_soil)[1:2] <- c("geo_id","year")
names(pesticide_soil_qsa)[1:2] <- c("geo_id","year")
names(pesticide_soil_com)[1:2] <- c("geo_id","year")
names(pesticide_air)[1:2] <- c("geo_id","year")
names(pesticide_water)[1:2] <- c("geo_id","year")

Active_substances_in_use <- pesticide_soil
Active_substances_in_use_raw <- pesticide_soil_qsa
Active_substances_in_use_com <- pesticide_soil_com
Active_substances_in_air <- pesticide_air
Active_substances_in_water <- pesticide_water

saveRDS(Active_substances_in_use,"output/Active_substances_in_use.rds")
st_write(Active_substances_in_use,dsn="output/Active_substances_in_use.gpkg")

saveRDS(Active_substances_in_use_raw,"output/Active_substances_in_use_raw.rds")
st_write(Active_substances_in_use_raw,dsn="output/Active_substances_in_use_raw.gpkg")

saveRDS(Active_substances_in_air,"output/Active_substances_in_air.rds")
st_write(Active_substances_in_air,dsn="output/Active_substances_in_air.gpkg")

saveRDS(Active_substances_in_water,"output/Active_substances_in_water.rds")
st_write(Active_substances_in_water,dsn="output/Active_substances_in_water.gpkg")


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
pesticide_soil_com_CMR <- itt_pesticide_year_com[,c(1,2,which(names(itt_pesticide_year_com) %in% mandatory_all & names(itt_pesticide_year_com) %in% sa_TTCMR))]
pesticide_soil_qsa_CMR <- qsa_pesticide_year[,c(1,2,which(names(qsa_pesticide_year) %in% mandatory_all & names(qsa_pesticide_year) %in% sa_TTCMR))]
pesticide_soil_qsa_com_CMR <- qsa_pesticide_year_com[,c(1,2,which(names(qsa_pesticide_year_com) %in% mandatory_all & names(qsa_pesticide_year_com) %in% sa_TTCMR))]
pesticide_soil_qsa_dhsa_com_CMR <- qsa_dhsa_pesticide_year_com[,c(1:6,which(names(qsa_dhsa_pesticide_year_com) %in% mandatory_all & names(qsa_dhsa_pesticide_year_com) %in% sa_TTCMR))]
pesticide_air_CMR <- df_sa_year_long[,c(1,2,which(names(df_sa_year_long) %in% mandatory_all & names(df_sa_year_long) %in% sa_TTCMR))]
pesticide_water_CMR <- bassin_versant_all_year[,c(1,2,which(names(bassin_versant_all_year) %in% mandatory_all & names(bassin_versant_all_year) %in% sa_TTCMR))]

saveRDS(pesticide_soil_CMR,"output/pesticide_soil_CMR.rds")
saveRDS(pesticide_soil_com_CMR,"output/pesticide_soil_com_CMR.rds")
saveRDS(pesticide_soil_qsa_dhsa_com_CMR,"output/pesticide_soil_qsa_dhsa_com_CMR.rds")
saveRDS(pesticide_air_CMR,"output/pesticide_air_CMR.rds")
saveRDS(pesticide_water_CMR,"output/pesticide_water_CMR.rds")

sa_class <- unique(pesticide_pre_itt[c('substance', "cas",'classification')])
sa_TTCMR <- sa_class[which(sa_class$classification %in% c("T, T+, CMR","Env A","Env B", "Santé A", "CMR")),]
sa_TTCMR <- unique(sa_TTCMR[c('substance', "cas")])
sa_TTCMR_mandatory <- merge(sa_TTCMR, mandatory_all_CAS, by.x="cas",by.y="CAS_number")
sa_TTCMR_mandatory <- sa_TTCMR_mandatory[which(!sa_TTCMR_mandatory$active_substance=="Orange oil"),]
sa_TTCMR_mandatory$active_substance[which(sa_TTCMR_mandatory$active_substance=="Gibberellins")] <- "Glufosinate"

pesticide_soil_qsa_dhsa_com_CMR <- qsa_dhsa_pesticide_year_com[,c(1:6,which(names(qsa_dhsa_pesticide_year_com) %in% sa_TTCMR_mandatory$active_substance))]
pesticide_air_CMR <- df_sa_year_long[,c(1,2,which(names(df_sa_year_long) %in% sa_TTCMR_mandatory$active_substance))]
pesticide_water_CMR <- bassin_versant_all_year[,c(1,2,which(names(bassin_versant_all_year) %in% sa_TTCMR_mandatory$active_substance))]


substance_active_unique$as_use <- NA
substance_active_unique$as_use[which(substance_active_unique$Nom.substance.active %in% names(pesticide_soil_qsa_dhsa_com_CMR))] <- 1
substance_active_unique$as_air <- NA
substance_active_unique$as_air[which(substance_active_unique$Nom.substance.active %in% names(pesticide_air_CMR))] <- 1
substance_active_unique$as_water <- NA
substance_active_unique$as_water[which(substance_active_unique$Nom.substance.active %in% names(pesticide_water_CMR))] <- 1
substance_active_unique_selected <- substance_active_unique[which(substance_active_unique$as_use == 1 | substance_active_unique$as_air == 1 | substance_active_unique$as_water == 1),c("Nom.substance.active","Numero.CAS","as_use","as_air","as_water")]
write.csv(substance_active_unique_selected,"output/substance_active_unique_selected.csv",row.names = FALSE)

average_soil_CMR <- pesticide_soil_CMR
st_geometry(average_soil_CMR) <- NULL
average_soil_CMR <- apply(average_soil_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_soil_CMR$all_itt <- average_soil_CMR
pesticide_soil_CMR$all_itt[which(is.infinite(pesticide_soil_CMR$all_itt))] <- NA
pesticide_soil_CMR_average <- st_as_sf(data.frame(pesticide_soil_CMR %>% group_by(Postal_code) %>% summarise(mean_itt = mean(all_itt, na.rm=T))))

ggplot(pesticide_soil_CMR_average)+
  geom_sf(aes(fill=log(mean_itt+1)), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_minimal() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))

average_soil_com_CMR <- pesticide_soil_com_CMR
st_geometry(average_soil_com_CMR) <- NULL
average_soil_com_CMR <- apply(average_soil_com_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_soil_com_CMR$all_itt <- average_soil_com_CMR
pesticide_soil_com_CMR_average <- st_as_sf(data.frame(pesticide_soil_com_CMR %>% group_by(Insee_com) %>% summarise(mean_itt = mean(all_itt, na.rm=T))))

ggplot(pesticide_soil_com_CMR_average)+
  geom_sf(aes(fill=log(mean_itt+1)), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_minimal() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))

average_soil_qsa_CMR <- pesticide_soil_qsa_CMR
st_geometry(average_soil_qsa_CMR) <- NULL
average_soil_qsa_CMR <- apply(average_soil_qsa_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_soil_qsa_CMR$all_qsa <- average_soil_qsa_CMR
pesticide_soil_qsa_CMR$all_qsa[which(is.infinite(pesticide_soil_qsa_CMR$all_qsa))] <- NA
pesticide_soil_qsa_CMR_average <- st_as_sf(data.frame(pesticide_soil_qsa_CMR %>% group_by(Postal_code) %>% summarise(mean_qsa = mean(all_qsa, na.rm=T))))

average_soil_qsa_com_CMR <- pesticide_soil_qsa_com_CMR
st_geometry(average_soil_qsa_com_CMR) <- NULL
average_soil_qsa_com_CMR <- apply(average_soil_qsa_com_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_soil_qsa_com_CMR$all_qsa <- average_soil_qsa_com_CMR
pesticide_soil_qsa_com_CMR$all_qsa[which(is.infinite(pesticide_soil_qsa_com_CMR$all_qsa))] <- NA
pesticide_soil_qsa_com_CMR_average <- st_as_sf(data.frame(pesticide_soil_qsa_com_CMR %>% group_by(Insee_com) %>% summarise(mean_qsa = mean(all_qsa, na.rm=T))))

average_soil_qsa_dhsa_com_CMR <- pesticide_soil_qsa_dhsa_com_CMR
st_geometry(average_soil_qsa_dhsa_com_CMR) <- NULL
average_soil_qsa_dhsa_com_CMR <- apply(average_soil_qsa_dhsa_com_CMR[,-c(1:6)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_soil_qsa_dhsa_com_CMR$all_qsa <- average_soil_qsa_dhsa_com_CMR
pesticide_soil_qsa_dhsa_com_CMR$all_itt <- pesticide_soil_qsa_dhsa_com_CMR$all_qsa/pesticide_soil_qsa_dhsa_com_CMR$Superficie
#pesticide_soil_qsa_dhsa_com_CMR$all_qsa[which(is.infinite(pesticide_soil_qsa_dhsa_com_CMR$all_qsa))] <- NA
pesticide_soil_qsa_dhsa_com_CMR_average <- st_as_sf(data.frame(pesticide_soil_qsa_dhsa_com_CMR %>% group_by(Insee_com) %>% summarise(mean_qsa = mean(all_qsa, na.rm=T), mean_itt = mean(all_itt, na.rm=T))))



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
#saveRDS(pesticide_soil_com_CMR_average,"output/pesticide_soil_com_CMR_average.rds")
pesticide_soil_com_CMR_average <- readRDS("output/pesticide_soil_com_CMR_average.rds")
#saveRDS(pesticide_soil_qsa_dhsa_com_CMR_average,"output/pesticide_soil_qsa_dhsa_com_CMR_average.rds")
pesticide_soil_qsa_dhsa_com_CMR_average <- readRDS("output/pesticide_soil_qsa_dhsa_com_CMR_average.rds")
#saveRDS(pesticide_air_CMR_average,"output/pesticide_air_CMR_average.rds")
pesticide_air_CMR_average <- readRDS("output/pesticide_air_CMR_average.rds")
#saveRDS(pesticide_water_CMR_average,"output/pesticide_water_CMR_average.rds")
pesticide_water_CMR_average <- readRDS("output/pesticide_water_CMR_average.rds")

# rescale values

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

threshold_soil_com <- quantile(pesticide_soil_com_CMR_average$mean_itt,0.995 ,na.rm = TRUE)
pesticide_soil_com_CMR_average$mean_itt[which(pesticide_soil_com_CMR_average$mean_itt>threshold_soil_com)] <- threshold_soil_com
pesticide_soil_com_CMR_average$mean_itt_scale <- scales::rescale(pesticide_soil_com_CMR_average$mean_itt)
ggplot(pesticide_soil_com_CMR_average)+
  geom_sf(aes(fill=mean_itt), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))

ggsave("output/figure_sa_com_use.png",
       width = 6,
       height = 6,
       dpi = 400)

threshold_soil_qsa_dhsa_com <- quantile(pesticide_soil_qsa_dhsa_com_CMR_average$mean_qsa,0.995 ,na.rm = TRUE)
pesticide_soil_qsa_dhsa_com_CMR_average$mean_qsa[which(pesticide_soil_qsa_dhsa_com_CMR_average$mean_qsa>threshold_soil_qsa_dhsa_com)] <- threshold_soil_qsa_dhsa_com
pesticide_soil_qsa_dhsa_com_CMR_average$mean_qsa_scale <- scales::rescale(pesticide_soil_qsa_dhsa_com_CMR_average$mean_qsa)
ggplot(pesticide_soil_qsa_dhsa_com_CMR_average)+
  geom_sf(aes(fill=mean_qsa), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))
ggsave("output/figure_sa_com_qsa_accurate.png",
       width = 6,
       height = 6,
       dpi = 400)

threshold_soil_qsa_dhsa_com <- quantile(pesticide_soil_qsa_dhsa_com_CMR_average$mean_itt,0.995 ,na.rm = TRUE)
pesticide_soil_qsa_dhsa_com_CMR_average$mean_itt[which(pesticide_soil_qsa_dhsa_com_CMR_average$mean_itt>threshold_soil_qsa_dhsa_com)] <- threshold_soil_qsa_dhsa_com
pesticide_soil_qsa_dhsa_com_CMR_average$mean_itt_scale <- scales::rescale(pesticide_soil_qsa_dhsa_com_CMR_average$mean_itt)
ggplot(pesticide_soil_qsa_dhsa_com_CMR_average)+
  geom_sf(aes(fill=mean_itt), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))

ggsave("output/figure_sa_com_use_accurate.png",
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

pesticide_soil_CMR_average <- pesticide_soil_CMR_average[which(as.numeric(str_sub(pesticide_soil_CMR_average$Postal_code,1,2)) < 96),]
pesticide_soil_qsa_dhsa_com_CMR_average <- pesticide_soil_qsa_dhsa_com_CMR_average[which(str_sub(pesticide_soil_qsa_dhsa_com_CMR_average$Insee_com,1,2) != "97"),]


#st_write(pesticide_soil_CMR_average,dsn="output/pesticide_CMR_soil.gpkg")
st_write(pesticide_soil_qsa_dhsa_com_CMR_average,dsn="output/pesticide_CMR_soil.gpkg")
st_write(pesticide_air_CMR_average,dsn="output/pesticide_CMR_air.gpkg")
st_write(pesticide_water_CMR_average,dsn="output/pesticide_CMR_water.gpkg")


# combine maps

pesticide_soil_CMR_average <- st_read("output/pesticide_CMR_soil.gpkg")
pesticide_air_CMR_average <- st_read("output/pesticide_CMR_air.gpkg")
pesticide_water_CMR_average <- st_read("output/pesticide_CMR_water.gpkg")

max_soil <- max(na.omit(pesticide_soil_CMR_average$mean_itt))*2
max_air <- max(pesticide_air_CMR_average$mean_concentration)*2
max_water <- max(pesticide_water_CMR_average$mean_concentration)*2

pesticide_CMR_all <- pesticide_air_CMR_average
pesticide_CMR_all$mean_concentration_scale <- scales::rescale(pesticide_CMR_all$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average <- st_transform(pesticide_soil_CMR_average,st_crs(pesticide_CMR_all))
pesticide_soil_CMR_average$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average <- st_transform(pesticide_water_CMR_average,st_crs(pesticide_CMR_all))
pesticide_soil_CMR_average$mean_concentration_scale <- scales::rescale(pesticide_soil_CMR_average$mean_concentration, from = c(0,max_water))

pesticide_CMR_all_df <- st_intersection(pesticide_CMR_all,pesticide_soil_CMR_average[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_all_df$area <- as.numeric(st_area(pesticide_CMR_all_df))
pesticide_CMR_all_df$mean_itt_area <- pesticide_CMR_all_df$mean_itt*pesticide_CMR_all_df$area
pesticide_CMR_all_df$mean_itt_scale_area <- pesticide_CMR_all_df$mean_itt_scale*pesticide_CMR_all_df$area
pesticide_CMR_all_df <- data.frame(data.frame(pesticide_CMR_all_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_all$area <- as.numeric(st_area(pesticide_CMR_all))
pesticide_CMR_all$mean_itt <- pesticide_CMR_all_df$sum_itt_area/pesticide_CMR_all$area
pesticide_CMR_all$mean_itt_scale <- pesticide_CMR_all_df$sum_itt_scale_area/pesticide_CMR_all$area

pesticide_CMR_all_df <- st_intersection(pesticide_CMR_all[,c("id")],pesticide_water_CMR_average[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_all_df$area <- as.numeric(st_area(pesticide_CMR_all_df))
pesticide_CMR_all_df$mean_concentration_area <- pesticide_CMR_all_df$mean_concentration*pesticide_CMR_all_df$area
pesticide_CMR_all_df$mean_concentration_scale_area <- pesticide_CMR_all_df$mean_concentration_scale*pesticide_CMR_all_df$area
pesticide_CMR_all_df <- data.frame(data.frame(pesticide_CMR_all_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_all_df_toadd <- data.frame(id=which(!(pesticide_CMR_all$id %in% pesticide_CMR_all_df$id)),sum_concentration_area=NA,sum_concentration_scale_area=NA)
pesticide_CMR_all_df <- rbind(pesticide_CMR_all_df,pesticide_CMR_all_df_toadd)
pesticide_CMR_all_df <- with(pesticide_CMR_all_df, pesticide_CMR_all_df[order(id),])
pesticide_CMR_all$mean_concentration_water <- pesticide_CMR_all_df$sum_concentration_area/pesticide_CMR_all$area
pesticide_CMR_all$mean_concentration_scale_water <- pesticide_CMR_all_df$sum_concentration_scale_area/pesticide_CMR_all$area

pesticide_CMR_all$all_pesticide_exposure <- pesticide_CMR_all$mean_concentration_scale + pesticide_CMR_all$mean_itt_scale + pesticide_CMR_all$mean_concentration_scale_water
ggplot(pesticide_CMR_all)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggsave("output/figure_sa_combined.png",
       width = 6,
       height = 6,
       dpi = 400)


# save all

#saveRDS(pesticide_CMR_all,"output/pesticide_CMR_all.rds")
st_write(pesticide_CMR_all,dsn="output/pesticide_CMR_all.gpkg")
Combined_exposure_to_active_substance_in_use_air_and_water <- pesticide_CMR_all
st_write(Combined_exposure_to_active_substance_in_use_air_and_water,dsn="output/Combined_exposure_to_active_substance_in_use_air_and_water.gpkg")



# maps by year


pesticide_soil_CMR <- readRDS("output/pesticide_soil_qsa_dhsa_com_CMR.rds") #readRDS("output/pesticide_soil_CMR.rds")
pesticide_air_CMR <- readRDS("output/pesticide_air_CMR.rds")
pesticide_water_CMR <- readRDS("output/pesticide_water_CMR.rds")


#average_soil_CMR <- pesticide_soil_CMR
#st_geometry(average_soil_CMR) <- NULL
#average_soil_CMR <- apply(average_soil_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
#pesticide_soil_CMR$all_itt <- average_soil_CMR
#pesticide_soil_CMR_average_year <- st_as_sf(data.frame(data.frame(pesticide_soil_CMR) %>% group_by(Postal_code,geometry,Annee) %>% summarise(mean_itt = mean(all_itt, na.rm=T))))
#pesticide_soil_CMR_average_year$mean_itt[which(is.infinite(pesticide_soil_CMR_average_year$mean_itt))] <- NA
#threshold_soil <- quantile(pesticide_soil_CMR_average_year$mean_itt,0.995 ,na.rm = TRUE)
#pesticide_soil_CMR_average_year$mean_itt[which(pesticide_soil_CMR_average_year$mean_itt>threshold_soil)] <- threshold_soil
#pesticide_soil_CMR_average_year$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_year$mean_itt)

average_soil_CMR <- pesticide_soil_CMR
st_geometry(average_soil_CMR) <- NULL
iit_CMR <- apply(average_soil_CMR[,-c(1:6)], 2, function(x,div){x/div}, div=average_soil_CMR$Superficie)
pesticide_soil_CMR[,7:(ncol(pesticide_soil_CMR)-1)] <- iit_CMR

average_soil_CMR <- apply(iit_CMR, 1, function(x){sum(x, na.rm=TRUE)})
pesticide_soil_CMR$all_itt <- average_soil_CMR
pesticide_soil_CMR_average_year <- st_as_sf(data.frame(data.frame(pesticide_soil_CMR) %>% group_by(Insee_com,geometry,Annee) %>% summarise(mean_itt = mean(all_itt, na.rm=T))))
threshold_soil <- quantile(pesticide_soil_CMR_average_year$mean_itt,0.995 ,na.rm = TRUE)
pesticide_soil_CMR_average_year$mean_itt[which(pesticide_soil_CMR_average_year$mean_itt>threshold_soil)] <- threshold_soil

ggplot(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$Annee==2013),])+
  geom_sf(aes(fill=mean_itt), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_minimal() +
  coord_sf(xlim = c(25690,1181938),ylim=c(6022753,7227759))

average_air_CMR <- pesticide_air_CMR
st_geometry(average_air_CMR) <- NULL
average_air_CMR <- apply(average_air_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
average_air_CMR[average_air_CMR<0] <- 0
pesticide_air_CMR$Concentration_total <- average_air_CMR
pesticide_air_CMR_average_year <- st_as_sf(data.frame(data.frame(pesticide_air_CMR) %>% group_by(id,geometry,year) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))

threshold_air <- quantile(pesticide_air_CMR_average_year$mean_concentration,0.995)
pesticide_air_CMR_average_year$mean_concentration[which(pesticide_air_CMR_average_year$mean_concentration>threshold_air)] <- threshold_air
#pesticide_air_CMR_average$mean_concentration_scale <- scales::rescale(pesticide_air_CMR_average$mean_concentration)

ggplot(pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2013),])+
  geom_sf(aes(fill=mean_concentration), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_minimal()

average_water_CMR <- pesticide_water_CMR
st_geometry(average_water_CMR) <- NULL
average_water_CMR <- apply(average_water_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})
pesticide_water_CMR$Concentration_total <- average_water_CMR
pesticide_water_CMR_average_year <- st_as_sf(data.frame(data.frame(pesticide_water_CMR) %>% group_by(CdOH,geometry,year) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))

threshold_water <- quantile(pesticide_water_CMR_average_year$mean_concentration,0.995)
pesticide_water_CMR_average_year$mean_concentration[which(pesticide_water_CMR_average_year$mean_concentration>threshold_water)] <- threshold_water
#pesticide_water_CMR_average_year$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_year$mean_concentration)

ggplot(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2013),])+
  geom_sf(aes(fill=mean_concentration), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_minimal()

names(pesticide_soil_CMR_average_year)[2] <- "year"

pesticide_soil_CMR_average_year <- pesticide_soil_CMR_average_year[which(str_sub(pesticide_soil_CMR_average_year$Insee_com,1,2) != "97"),]


st_write(pesticide_soil_CMR_average_year,dsn="output/pesticide_CMR_soil_year.gpkg")
st_write(pesticide_air_CMR_average_year,dsn="output/pesticide_CMR_air_year.gpkg")
st_write(pesticide_water_CMR_average_year,dsn="output/pesticide_CMR_water_year.gpkg")



## maps for 2013 to 2022

max_soil <- max(na.omit(pesticide_soil_CMR_average_year$mean_itt))*2
max_air <- max(pesticide_air_CMR_average_year$mean_concentration)*2
max_water <- max(pesticide_water_CMR_average_year$mean_concentration)*2


pesticide_CMR_2013 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2013),]
pesticide_CMR_2013$mean_concentration_scale <- scales::rescale(pesticide_CMR_2013$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2013 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2013),],st_crs(pesticide_CMR_2013))
pesticide_soil_CMR_average_2013$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2013$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2013 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2013),],st_crs(pesticide_CMR_2013))
pesticide_water_CMR_average_2013$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2013$mean_concentration, from = c(0,max_water))

pesticide_CMR_2013_df <- st_intersection(pesticide_CMR_2013,pesticide_soil_CMR_average_2013[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2013_df$area <- as.numeric(st_area(pesticide_CMR_2013_df))
pesticide_CMR_2013_df$mean_itt_area <- pesticide_CMR_2013_df$mean_itt*pesticide_CMR_2013_df$area
pesticide_CMR_2013_df$mean_itt_scale_area <- pesticide_CMR_2013_df$mean_itt_scale*pesticide_CMR_2013_df$area
pesticide_CMR_2013_df <- data.frame(data.frame(pesticide_CMR_2013_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2013$area <- as.numeric(st_area(pesticide_CMR_2013))
pesticide_CMR_2013$mean_itt <- pesticide_CMR_2013_df$sum_itt_area/pesticide_CMR_2013$area
pesticide_CMR_2013$mean_itt_scale <- pesticide_CMR_2013_df$sum_itt_scale_area/pesticide_CMR_2013$area

pesticide_CMR_2013_df <- st_intersection(pesticide_CMR_2013[,c("id")],pesticide_water_CMR_average_2013[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2013_df$area <- as.numeric(st_area(pesticide_CMR_2013_df))
pesticide_CMR_2013_df$mean_concentration_area <- pesticide_CMR_2013_df$mean_concentration*pesticide_CMR_2013_df$area
pesticide_CMR_2013_df$mean_concentration_scale_area <- pesticide_CMR_2013_df$mean_concentration_scale*pesticide_CMR_2013_df$area
pesticide_CMR_2013_df <- data.frame(data.frame(pesticide_CMR_2013_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2013_df_toadd <- data.frame(id=which(!(pesticide_CMR_2013$id %in% pesticide_CMR_2013_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2013_df <- rbind(pesticide_CMR_2013_df,pesticide_CMR_2013_df_toadd)
pesticide_CMR_2013_df <- with(pesticide_CMR_2013_df, pesticide_CMR_2013_df[order(id),])
pesticide_CMR_2013$mean_concentration_water <- pesticide_CMR_2013_df$sum_concentration_area/pesticide_CMR_2013$area
pesticide_CMR_2013$mean_concentration_scale_water <- pesticide_CMR_2013_df$sum_concentration_scale_area/pesticide_CMR_2013$area

pesticide_CMR_2013$all_pesticide_exposure <- pesticide_CMR_2013$mean_concentration_scale + pesticide_CMR_2013$mean_itt_scale + pesticide_CMR_2013$mean_concentration_scale_water


saveRDS(pesticide_CMR_2013,"output/pesticide_CMR_2013.rds")

ggplot(pesticide_CMR_2013)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()




pesticide_CMR_2014 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2014),]
pesticide_CMR_2014$mean_concentration_scale <- scales::rescale(pesticide_CMR_2014$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2014 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2014),],st_crs(pesticide_CMR_2014))
pesticide_soil_CMR_average_2014$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2014$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2014 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2014),],st_crs(pesticide_CMR_2014))
pesticide_water_CMR_average_2014$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2014$mean_concentration, from = c(0,max_water))

pesticide_CMR_2014_df <- st_intersection(pesticide_CMR_2014,pesticide_soil_CMR_average_2014[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2014_df$area <- as.numeric(st_area(pesticide_CMR_2014_df))
pesticide_CMR_2014_df$mean_itt_area <- pesticide_CMR_2014_df$mean_itt*pesticide_CMR_2014_df$area
pesticide_CMR_2014_df$mean_itt_scale_area <- pesticide_CMR_2014_df$mean_itt_scale*pesticide_CMR_2014_df$area
pesticide_CMR_2014_df <- data.frame(data.frame(pesticide_CMR_2014_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2014$area <- as.numeric(st_area(pesticide_CMR_2014))
pesticide_CMR_2014$mean_itt <- pesticide_CMR_2014_df$sum_itt_area/pesticide_CMR_2014$area
pesticide_CMR_2014$mean_itt_scale <- pesticide_CMR_2014_df$sum_itt_scale_area/pesticide_CMR_2014$area

pesticide_CMR_2014_df <- st_intersection(pesticide_CMR_2014[,c("id")],pesticide_water_CMR_average_2014[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2014_df$area <- as.numeric(st_area(pesticide_CMR_2014_df))
pesticide_CMR_2014_df$mean_concentration_area <- pesticide_CMR_2014_df$mean_concentration*pesticide_CMR_2014_df$area
pesticide_CMR_2014_df$mean_concentration_scale_area <- pesticide_CMR_2014_df$mean_concentration_scale*pesticide_CMR_2014_df$area
pesticide_CMR_2014_df <- data.frame(data.frame(pesticide_CMR_2014_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2014_df_toadd <- data.frame(id=which(!(pesticide_CMR_2014$id %in% pesticide_CMR_2014_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2014_df <- rbind(pesticide_CMR_2014_df,pesticide_CMR_2014_df_toadd)
pesticide_CMR_2014_df <- with(pesticide_CMR_2014_df, pesticide_CMR_2014_df[order(id),])
pesticide_CMR_2014$mean_concentration_water <- pesticide_CMR_2014_df$sum_concentration_area/pesticide_CMR_2014$area
pesticide_CMR_2014$mean_concentration_scale_water <- pesticide_CMR_2014_df$sum_concentration_scale_area/pesticide_CMR_2014$area

pesticide_CMR_2014$all_pesticide_exposure <- pesticide_CMR_2014$mean_concentration_scale + pesticide_CMR_2014$mean_itt_scale + pesticide_CMR_2014$mean_concentration_scale_water


saveRDS(pesticide_CMR_2014,"output/pesticide_CMR_2014.rds")

ggplot(pesticide_CMR_2014)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()



pesticide_CMR_2015 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2015),]
pesticide_CMR_2015$mean_concentration_scale <- scales::rescale(pesticide_CMR_2015$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2015 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2015),],st_crs(pesticide_CMR_2015))
pesticide_soil_CMR_average_2015$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2015$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2015 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2015),],st_crs(pesticide_CMR_2015))
pesticide_water_CMR_average_2015$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2015$mean_concentration, from = c(0,max_water))

pesticide_CMR_2015_df <- st_intersection(pesticide_CMR_2015,pesticide_soil_CMR_average_2015[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2015_df$area <- as.numeric(st_area(pesticide_CMR_2015_df))
pesticide_CMR_2015_df$mean_itt_area <- pesticide_CMR_2015_df$mean_itt*pesticide_CMR_2015_df$area
pesticide_CMR_2015_df$mean_itt_scale_area <- pesticide_CMR_2015_df$mean_itt_scale*pesticide_CMR_2015_df$area
pesticide_CMR_2015_df <- data.frame(data.frame(pesticide_CMR_2015_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2015$area <- as.numeric(st_area(pesticide_CMR_2015))
pesticide_CMR_2015$mean_itt <- pesticide_CMR_2015_df$sum_itt_area/pesticide_CMR_2015$area
pesticide_CMR_2015$mean_itt_scale <- pesticide_CMR_2015_df$sum_itt_scale_area/pesticide_CMR_2015$area

pesticide_CMR_2015_df <- st_intersection(pesticide_CMR_2015[,c("id")],pesticide_water_CMR_average_2015[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2015_df$area <- as.numeric(st_area(pesticide_CMR_2015_df))
pesticide_CMR_2015_df$mean_concentration_area <- pesticide_CMR_2015_df$mean_concentration*pesticide_CMR_2015_df$area
pesticide_CMR_2015_df$mean_concentration_scale_area <- pesticide_CMR_2015_df$mean_concentration_scale*pesticide_CMR_2015_df$area
pesticide_CMR_2015_df <- data.frame(data.frame(pesticide_CMR_2015_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2015_df_toadd <- data.frame(id=which(!(pesticide_CMR_2015$id %in% pesticide_CMR_2015_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2015_df <- rbind(pesticide_CMR_2015_df,pesticide_CMR_2015_df_toadd)
pesticide_CMR_2015_df <- with(pesticide_CMR_2015_df, pesticide_CMR_2015_df[order(id),])
pesticide_CMR_2015$mean_concentration_water <- pesticide_CMR_2015_df$sum_concentration_area/pesticide_CMR_2015$area
pesticide_CMR_2015$mean_concentration_scale_water <- pesticide_CMR_2015_df$sum_concentration_scale_area/pesticide_CMR_2015$area

pesticide_CMR_2015$all_pesticide_exposure <- pesticide_CMR_2015$mean_concentration_scale + pesticide_CMR_2015$mean_itt_scale + pesticide_CMR_2015$mean_concentration_scale_water


saveRDS(pesticide_CMR_2015,"output/pesticide_CMR_2015.rds")

ggplot(pesticide_CMR_2015)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()



pesticide_CMR_2016 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2016),]
pesticide_CMR_2016$mean_concentration_scale <- scales::rescale(pesticide_CMR_2016$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2016 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2016),],st_crs(pesticide_CMR_2016))
pesticide_soil_CMR_average_2016$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2016$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2016 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2016),],st_crs(pesticide_CMR_2016))
pesticide_water_CMR_average_2016$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2016$mean_concentration, from = c(0,max_water))

pesticide_CMR_2016_df <- st_intersection(pesticide_CMR_2016,pesticide_soil_CMR_average_2016[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2016_df$area <- as.numeric(st_area(pesticide_CMR_2016_df))
pesticide_CMR_2016_df$mean_itt_area <- pesticide_CMR_2016_df$mean_itt*pesticide_CMR_2016_df$area
pesticide_CMR_2016_df$mean_itt_scale_area <- pesticide_CMR_2016_df$mean_itt_scale*pesticide_CMR_2016_df$area
pesticide_CMR_2016_df <- data.frame(data.frame(pesticide_CMR_2016_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2016$area <- as.numeric(st_area(pesticide_CMR_2016))
pesticide_CMR_2016$mean_itt <- pesticide_CMR_2016_df$sum_itt_area/pesticide_CMR_2016$area
pesticide_CMR_2016$mean_itt_scale <- pesticide_CMR_2016_df$sum_itt_scale_area/pesticide_CMR_2016$area

pesticide_CMR_2016_df <- st_intersection(pesticide_CMR_2016[,c("id")],pesticide_water_CMR_average_2016[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2016_df$area <- as.numeric(st_area(pesticide_CMR_2016_df))
pesticide_CMR_2016_df$mean_concentration_area <- pesticide_CMR_2016_df$mean_concentration*pesticide_CMR_2016_df$area
pesticide_CMR_2016_df$mean_concentration_scale_area <- pesticide_CMR_2016_df$mean_concentration_scale*pesticide_CMR_2016_df$area
pesticide_CMR_2016_df <- data.frame(data.frame(pesticide_CMR_2016_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2016_df_toadd <- data.frame(id=which(!(pesticide_CMR_2016$id %in% pesticide_CMR_2016_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2016_df <- rbind(pesticide_CMR_2016_df,pesticide_CMR_2016_df_toadd)
pesticide_CMR_2016_df <- with(pesticide_CMR_2016_df, pesticide_CMR_2016_df[order(id),])
pesticide_CMR_2016$mean_concentration_water <- pesticide_CMR_2016_df$sum_concentration_area/pesticide_CMR_2016$area
pesticide_CMR_2016$mean_concentration_scale_water <- pesticide_CMR_2016_df$sum_concentration_scale_area/pesticide_CMR_2016$area

pesticide_CMR_2016$all_pesticide_exposure <- pesticide_CMR_2016$mean_concentration_scale + pesticide_CMR_2016$mean_itt_scale + pesticide_CMR_2016$mean_concentration_scale_water


saveRDS(pesticide_CMR_2016,"output/pesticide_CMR_2016.rds")

ggplot(pesticide_CMR_2016)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()




pesticide_CMR_2017 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2017),]
pesticide_CMR_2017$mean_concentration_scale <- scales::rescale(pesticide_CMR_2017$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2017 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2017),],st_crs(pesticide_CMR_2017))
pesticide_soil_CMR_average_2017$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2017$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2017 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2017),],st_crs(pesticide_CMR_2017))
pesticide_water_CMR_average_2017$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2017$mean_concentration, from = c(0,max_water))

pesticide_CMR_2017_df <- st_intersection(pesticide_CMR_2017,pesticide_soil_CMR_average_2017[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2017_df$area <- as.numeric(st_area(pesticide_CMR_2017_df))
pesticide_CMR_2017_df$mean_itt_area <- pesticide_CMR_2017_df$mean_itt*pesticide_CMR_2017_df$area
pesticide_CMR_2017_df$mean_itt_scale_area <- pesticide_CMR_2017_df$mean_itt_scale*pesticide_CMR_2017_df$area
pesticide_CMR_2017_df <- data.frame(data.frame(pesticide_CMR_2017_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2017$area <- as.numeric(st_area(pesticide_CMR_2017))
pesticide_CMR_2017$mean_itt <- pesticide_CMR_2017_df$sum_itt_area/pesticide_CMR_2017$area
pesticide_CMR_2017$mean_itt_scale <- pesticide_CMR_2017_df$sum_itt_scale_area/pesticide_CMR_2017$area

pesticide_CMR_2017_df <- st_intersection(pesticide_CMR_2017[,c("id")],pesticide_water_CMR_average_2017[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2017_df$area <- as.numeric(st_area(pesticide_CMR_2017_df))
pesticide_CMR_2017_df$mean_concentration_area <- pesticide_CMR_2017_df$mean_concentration*pesticide_CMR_2017_df$area
pesticide_CMR_2017_df$mean_concentration_scale_area <- pesticide_CMR_2017_df$mean_concentration_scale*pesticide_CMR_2017_df$area
pesticide_CMR_2017_df <- data.frame(data.frame(pesticide_CMR_2017_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2017_df_toadd <- data.frame(id=which(!(pesticide_CMR_2017$id %in% pesticide_CMR_2017_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2017_df <- rbind(pesticide_CMR_2017_df,pesticide_CMR_2017_df_toadd)
pesticide_CMR_2017_df <- with(pesticide_CMR_2017_df, pesticide_CMR_2017_df[order(id),])
pesticide_CMR_2017$mean_concentration_water <- pesticide_CMR_2017_df$sum_concentration_area/pesticide_CMR_2017$area
pesticide_CMR_2017$mean_concentration_scale_water <- pesticide_CMR_2017_df$sum_concentration_scale_area/pesticide_CMR_2017$area

pesticide_CMR_2017$all_pesticide_exposure <- pesticide_CMR_2017$mean_concentration_scale + pesticide_CMR_2017$mean_itt_scale + pesticide_CMR_2017$mean_concentration_scale_water


saveRDS(pesticide_CMR_2017,"output/pesticide_CMR_2017.rds")

ggplot(pesticide_CMR_2017)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()



pesticide_CMR_2018 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2018),]
pesticide_CMR_2018$mean_concentration_scale <- scales::rescale(pesticide_CMR_2018$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2018 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2018),],st_crs(pesticide_CMR_2018))
pesticide_soil_CMR_average_2018$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2018$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2018 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2018),],st_crs(pesticide_CMR_2018))
pesticide_water_CMR_average_2018$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2018$mean_concentration, from = c(0,max_water))

pesticide_CMR_2018_df <- st_intersection(pesticide_CMR_2018,pesticide_soil_CMR_average_2018[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2018_df$area <- as.numeric(st_area(pesticide_CMR_2018_df))
pesticide_CMR_2018_df$mean_itt_area <- pesticide_CMR_2018_df$mean_itt*pesticide_CMR_2018_df$area
pesticide_CMR_2018_df$mean_itt_scale_area <- pesticide_CMR_2018_df$mean_itt_scale*pesticide_CMR_2018_df$area
pesticide_CMR_2018_df <- data.frame(data.frame(pesticide_CMR_2018_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2018$area <- as.numeric(st_area(pesticide_CMR_2018))
pesticide_CMR_2018$mean_itt <- pesticide_CMR_2018_df$sum_itt_area/pesticide_CMR_2018$area
pesticide_CMR_2018$mean_itt_scale <- pesticide_CMR_2018_df$sum_itt_scale_area/pesticide_CMR_2018$area

pesticide_CMR_2018_df <- st_intersection(pesticide_CMR_2018[,c("id")],pesticide_water_CMR_average_2018[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2018_df$area <- as.numeric(st_area(pesticide_CMR_2018_df))
pesticide_CMR_2018_df$mean_concentration_area <- pesticide_CMR_2018_df$mean_concentration*pesticide_CMR_2018_df$area
pesticide_CMR_2018_df$mean_concentration_scale_area <- pesticide_CMR_2018_df$mean_concentration_scale*pesticide_CMR_2018_df$area
pesticide_CMR_2018_df <- data.frame(data.frame(pesticide_CMR_2018_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2018_df_toadd <- data.frame(id=which(!(pesticide_CMR_2018$id %in% pesticide_CMR_2018_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2018_df <- rbind(pesticide_CMR_2018_df,pesticide_CMR_2018_df_toadd)
pesticide_CMR_2018_df <- with(pesticide_CMR_2018_df, pesticide_CMR_2018_df[order(id),])
pesticide_CMR_2018$mean_concentration_water <- pesticide_CMR_2018_df$sum_concentration_area/pesticide_CMR_2018$area
pesticide_CMR_2018$mean_concentration_scale_water <- pesticide_CMR_2018_df$sum_concentration_scale_area/pesticide_CMR_2018$area

pesticide_CMR_2018$all_pesticide_exposure <- pesticide_CMR_2018$mean_concentration_scale + pesticide_CMR_2018$mean_itt_scale + pesticide_CMR_2018$mean_concentration_scale_water


saveRDS(pesticide_CMR_2018,"output/pesticide_CMR_2018.rds")

ggplot(pesticide_CMR_2018)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()



pesticide_CMR_2019 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2019),]
pesticide_CMR_2019$mean_concentration_scale <- scales::rescale(pesticide_CMR_2019$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2019 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2019),],st_crs(pesticide_CMR_2019))
pesticide_soil_CMR_average_2019$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2019$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2019 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2019),],st_crs(pesticide_CMR_2019))
pesticide_water_CMR_average_2019$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2019$mean_concentration, from = c(0,max_water))

pesticide_CMR_2019_df <- st_intersection(pesticide_CMR_2019,pesticide_soil_CMR_average_2019[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2019_df$area <- as.numeric(st_area(pesticide_CMR_2019_df))
pesticide_CMR_2019_df$mean_itt_area <- pesticide_CMR_2019_df$mean_itt*pesticide_CMR_2019_df$area
pesticide_CMR_2019_df$mean_itt_scale_area <- pesticide_CMR_2019_df$mean_itt_scale*pesticide_CMR_2019_df$area
pesticide_CMR_2019_df <- data.frame(data.frame(pesticide_CMR_2019_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2019$area <- as.numeric(st_area(pesticide_CMR_2019))
pesticide_CMR_2019$mean_itt <- pesticide_CMR_2019_df$sum_itt_area/pesticide_CMR_2019$area
pesticide_CMR_2019$mean_itt_scale <- pesticide_CMR_2019_df$sum_itt_scale_area/pesticide_CMR_2019$area

pesticide_CMR_2019_df <- st_intersection(pesticide_CMR_2019[,c("id")],pesticide_water_CMR_average_2019[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2019_df$area <- as.numeric(st_area(pesticide_CMR_2019_df))
pesticide_CMR_2019_df$mean_concentration_area <- pesticide_CMR_2019_df$mean_concentration*pesticide_CMR_2019_df$area
pesticide_CMR_2019_df$mean_concentration_scale_area <- pesticide_CMR_2019_df$mean_concentration_scale*pesticide_CMR_2019_df$area
pesticide_CMR_2019_df <- data.frame(data.frame(pesticide_CMR_2019_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2019_df_toadd <- data.frame(id=which(!(pesticide_CMR_2019$id %in% pesticide_CMR_2019_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2019_df <- rbind(pesticide_CMR_2019_df,pesticide_CMR_2019_df_toadd)
pesticide_CMR_2019_df <- with(pesticide_CMR_2019_df, pesticide_CMR_2019_df[order(id),])
pesticide_CMR_2019$mean_concentration_water <- pesticide_CMR_2019_df$sum_concentration_area/pesticide_CMR_2019$area
pesticide_CMR_2019$mean_concentration_scale_water <- pesticide_CMR_2019_df$sum_concentration_scale_area/pesticide_CMR_2019$area

pesticide_CMR_2019$all_pesticide_exposure <- pesticide_CMR_2019$mean_concentration_scale + pesticide_CMR_2019$mean_itt_scale + pesticide_CMR_2019$mean_concentration_scale_water


saveRDS(pesticide_CMR_2019,"output/pesticide_CMR_2019.rds")

ggplot(pesticide_CMR_2019)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()



pesticide_CMR_2020 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2020),]
pesticide_CMR_2020$mean_concentration_scale <- scales::rescale(pesticide_CMR_2020$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2020 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2020),],st_crs(pesticide_CMR_2020))
pesticide_soil_CMR_average_2020$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2020$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2020 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2020),],st_crs(pesticide_CMR_2020))
pesticide_water_CMR_average_2020$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2020$mean_concentration, from = c(0,max_water))

pesticide_CMR_2020_df <- st_intersection(pesticide_CMR_2020,pesticide_soil_CMR_average_2020[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2020_df$area <- as.numeric(st_area(pesticide_CMR_2020_df))
pesticide_CMR_2020_df$mean_itt_area <- pesticide_CMR_2020_df$mean_itt*pesticide_CMR_2020_df$area
pesticide_CMR_2020_df$mean_itt_scale_area <- pesticide_CMR_2020_df$mean_itt_scale*pesticide_CMR_2020_df$area
pesticide_CMR_2020_df <- data.frame(data.frame(pesticide_CMR_2020_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2020$area <- as.numeric(st_area(pesticide_CMR_2020))
pesticide_CMR_2020$mean_itt <- pesticide_CMR_2020_df$sum_itt_area/pesticide_CMR_2020$area
pesticide_CMR_2020$mean_itt_scale <- pesticide_CMR_2020_df$sum_itt_scale_area/pesticide_CMR_2020$area

pesticide_CMR_2020_df <- st_intersection(pesticide_CMR_2020[,c("id")],pesticide_water_CMR_average_2020[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2020_df$area <- as.numeric(st_area(pesticide_CMR_2020_df))
pesticide_CMR_2020_df$mean_concentration_area <- pesticide_CMR_2020_df$mean_concentration*pesticide_CMR_2020_df$area
pesticide_CMR_2020_df$mean_concentration_scale_area <- pesticide_CMR_2020_df$mean_concentration_scale*pesticide_CMR_2020_df$area
pesticide_CMR_2020_df <- data.frame(data.frame(pesticide_CMR_2020_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2020_df_toadd <- data.frame(id=which(!(pesticide_CMR_2020$id %in% pesticide_CMR_2020_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2020_df <- rbind(pesticide_CMR_2020_df,pesticide_CMR_2020_df_toadd)
pesticide_CMR_2020_df <- with(pesticide_CMR_2020_df, pesticide_CMR_2020_df[order(id),])
pesticide_CMR_2020$mean_concentration_water <- pesticide_CMR_2020_df$sum_concentration_area/pesticide_CMR_2020$area
pesticide_CMR_2020$mean_concentration_scale_water <- pesticide_CMR_2020_df$sum_concentration_scale_area/pesticide_CMR_2020$area

pesticide_CMR_2020$all_pesticide_exposure <- pesticide_CMR_2020$mean_concentration_scale + pesticide_CMR_2020$mean_itt_scale + pesticide_CMR_2020$mean_concentration_scale_water


saveRDS(pesticide_CMR_2020,"output/pesticide_CMR_2020.rds")

ggplot(pesticide_CMR_2020)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()


pesticide_CMR_2021 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2021),]
pesticide_CMR_2021$mean_concentration_scale <- scales::rescale(pesticide_CMR_2021$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2021 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2021),],st_crs(pesticide_CMR_2021))
pesticide_soil_CMR_average_2021$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2021$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2021 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2021),],st_crs(pesticide_CMR_2021))
pesticide_water_CMR_average_2021$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2021$mean_concentration, from = c(0,max_water))

pesticide_CMR_2021_df <- st_intersection(pesticide_CMR_2021,pesticide_soil_CMR_average_2021[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2021_df$area <- as.numeric(st_area(pesticide_CMR_2021_df))
pesticide_CMR_2021_df$mean_itt_area <- pesticide_CMR_2021_df$mean_itt*pesticide_CMR_2021_df$area
pesticide_CMR_2021_df$mean_itt_scale_area <- pesticide_CMR_2021_df$mean_itt_scale*pesticide_CMR_2021_df$area
pesticide_CMR_2021_df <- data.frame(data.frame(pesticide_CMR_2021_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2021$area <- as.numeric(st_area(pesticide_CMR_2021))
pesticide_CMR_2021$mean_itt <- pesticide_CMR_2021_df$sum_itt_area/pesticide_CMR_2021$area
pesticide_CMR_2021$mean_itt_scale <- pesticide_CMR_2021_df$sum_itt_scale_area/pesticide_CMR_2021$area

pesticide_CMR_2021_df <- st_intersection(pesticide_CMR_2021[,c("id")],pesticide_water_CMR_average_2021[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2021_df$area <- as.numeric(st_area(pesticide_CMR_2021_df))
pesticide_CMR_2021_df$mean_concentration_area <- pesticide_CMR_2021_df$mean_concentration*pesticide_CMR_2021_df$area
pesticide_CMR_2021_df$mean_concentration_scale_area <- pesticide_CMR_2021_df$mean_concentration_scale*pesticide_CMR_2021_df$area
pesticide_CMR_2021_df <- data.frame(data.frame(pesticide_CMR_2021_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2021_df_toadd <- data.frame(id=which(!(pesticide_CMR_2021$id %in% pesticide_CMR_2021_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2021_df <- rbind(pesticide_CMR_2021_df,pesticide_CMR_2021_df_toadd)
pesticide_CMR_2021_df <- with(pesticide_CMR_2021_df, pesticide_CMR_2021_df[order(id),])
pesticide_CMR_2021$mean_concentration_water <- pesticide_CMR_2021_df$sum_concentration_area/pesticide_CMR_2021$area
pesticide_CMR_2021$mean_concentration_scale_water <- pesticide_CMR_2021_df$sum_concentration_scale_area/pesticide_CMR_2021$area

pesticide_CMR_2021$all_pesticide_exposure <- pesticide_CMR_2021$mean_concentration_scale + pesticide_CMR_2021$mean_itt_scale + pesticide_CMR_2021$mean_concentration_scale_water


saveRDS(pesticide_CMR_2021,"output/pesticide_CMR_2021.rds")

ggplot(pesticide_CMR_2021)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()




pesticide_CMR_2022 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2022),]
pesticide_CMR_2022$mean_concentration_scale <- scales::rescale(pesticide_CMR_2022$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2022 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2022),],st_crs(pesticide_CMR_2022))
pesticide_soil_CMR_average_2022$mean_itt_scale <- scales::rescale(pesticide_soil_CMR_average_2022$mean_itt, from = c(0,max_soil))
pesticide_water_CMR_average_2022 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2022),],st_crs(pesticide_CMR_2022))
pesticide_water_CMR_average_2022$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2022$mean_concentration, from = c(0,max_water))

pesticide_CMR_2022_df <- st_intersection(pesticide_CMR_2022,pesticide_soil_CMR_average_2022[,c("mean_itt","mean_itt_scale")])
pesticide_CMR_2022_df$area <- as.numeric(st_area(pesticide_CMR_2022_df))
pesticide_CMR_2022_df$mean_itt_area <- pesticide_CMR_2022_df$mean_itt*pesticide_CMR_2022_df$area
pesticide_CMR_2022_df$mean_itt_scale_area <- pesticide_CMR_2022_df$mean_itt_scale*pesticide_CMR_2022_df$area
pesticide_CMR_2022_df <- data.frame(data.frame(pesticide_CMR_2022_df) %>% group_by(id) %>% summarise(sum_itt_area = sum(mean_itt_area, na.rm=TRUE), sum_itt_scale_area = sum(mean_itt_scale_area, na.rm=TRUE)))
pesticide_CMR_2022$area <- as.numeric(st_area(pesticide_CMR_2022))
pesticide_CMR_2022$mean_itt <- pesticide_CMR_2022_df$sum_itt_area/pesticide_CMR_2022$area
pesticide_CMR_2022$mean_itt_scale <- pesticide_CMR_2022_df$sum_itt_scale_area/pesticide_CMR_2022$area

pesticide_CMR_2022_df <- st_intersection(pesticide_CMR_2022[,c("id")],pesticide_water_CMR_average_2022[,c("mean_concentration","mean_concentration_scale")])
pesticide_CMR_2022_df$area <- as.numeric(st_area(pesticide_CMR_2022_df))
pesticide_CMR_2022_df$mean_concentration_area <- pesticide_CMR_2022_df$mean_concentration*pesticide_CMR_2022_df$area
pesticide_CMR_2022_df$mean_concentration_scale_area <- pesticide_CMR_2022_df$mean_concentration_scale*pesticide_CMR_2022_df$area
pesticide_CMR_2022_df <- data.frame(data.frame(pesticide_CMR_2022_df) %>% group_by(id) %>% summarise(sum_concentration_area = sum(mean_concentration_area, na.rm=TRUE), sum_concentration_scale_area = sum(mean_concentration_scale_area, na.rm=TRUE)))
pesticide_CMR_2022_df_toadd <- data.frame(id=which(!(pesticide_CMR_2022$id %in% pesticide_CMR_2022_df$id)),sum_concentration_area=NA, sum_concentration_scale_area=NA)
pesticide_CMR_2022_df <- rbind(pesticide_CMR_2022_df,pesticide_CMR_2022_df_toadd)
pesticide_CMR_2022_df <- with(pesticide_CMR_2022_df, pesticide_CMR_2022_df[order(id),])
pesticide_CMR_2022$mean_concentration_water <- pesticide_CMR_2022_df$sum_concentration_area/pesticide_CMR_2022$area
pesticide_CMR_2022$mean_concentration_scale_water <- pesticide_CMR_2022_df$sum_concentration_scale_area/pesticide_CMR_2022$area

pesticide_CMR_2022$all_pesticide_exposure <- pesticide_CMR_2022$mean_concentration_scale + pesticide_CMR_2022$mean_itt_scale + pesticide_CMR_2022$mean_concentration_scale_water


saveRDS(pesticide_CMR_2022,"output/pesticide_CMR_2022.rds")

ggplot(pesticide_CMR_2022)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

Yearly_exposure_to_active_substance_in_use_air_and_water <- rbind(pesticide_CMR_2013,pesticide_CMR_2014,pesticide_CMR_2015,pesticide_CMR_2016,
                                                                  pesticide_CMR_2017,pesticide_CMR_2018,pesticide_CMR_2019,pesticide_CMR_2020,
                                                                  pesticide_CMR_2021,pesticide_CMR_2022)

names(Yearly_exposure_to_active_substance_in_use_air_and_water)[c(3,4,6,7)] <- c("mean_concentration_air","mean_concentration_scale_air","mean_tii","mean_tii_scale")

saveRDS(Yearly_exposure_to_active_substance_in_use_air_and_water,"output/Yearly_exposure_to_active_substance_in_use_air_and_water.rds")
st_write(Yearly_exposure_to_active_substance_in_use_air_and_water,dsn="output/Yearly_exposure_to_active_substance_in_use_air_and_water.gpkg")

Trend_df <- Yearly_exposure_to_active_substance_in_use_air_and_water
st_geometry(Trend_df) <- NULL

Trend_result <- ddply(Trend_df, .(id), 
                      .fun = function(x){
                        if(length(which(!is.na(x$all_pesticide_exposure))) >= 8){
                          linear_trend_model <- lm(all_pesticide_exposure ~ year, data = x)
                          linear_trend <- summary(linear_trend_model)$coef[2,]
                        }else{
                          linear_trend <- rep(NA,4)
                        }
                        return(linear_trend)
                        }, .progress = "text")

Trend_result$Estimate_signif <- Trend_result$Estimate
Trend_result$Estimate_signif[which(Trend_result$`Pr(>|t|)` >= 0.05)] <- NA

saveRDS(Trend_result,"output/Trend_result.rds")

pesticide_CMR_trend <- readRDS("output/pesticide_CMR_2022.rds")
pesticide_CMR_trend$year <- NULL
pesticide_CMR_trend$mean_concentration <- NULL
pesticide_CMR_trend$mean_concentration_scale <- NULL
pesticide_CMR_trend$mean_itt <- NULL
pesticide_CMR_trend$mean_itt_scale <- NULL
pesticide_CMR_trend$mean_concentration_water <- NULL
pesticide_CMR_trend$mean_concentration_scale_water <- NULL
pesticide_CMR_trend$all_pesticide_exposure <- NULL

pesticide_CMR_trend$Estimate <- Trend_result$Estimate
pesticide_CMR_trend$`Std. Error` <- Trend_result$`Std. Error`
pesticide_CMR_trend$`t value` <- Trend_result$`t value`
pesticide_CMR_trend$`Pr(>|t|)` <- Trend_result$`Pr(>|t|)`
pesticide_CMR_trend$Estimate_signif <- Trend_result$Estimate_signif

saveRDS(pesticide_CMR_trend,"output/pesticide_CMR_trend.rds")

ggplot(pesticide_CMR_trend)+
  geom_sf(aes(fill=Estimate), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_void()

ggsave("output/figure_trend.png",
       width = 6,
       height = 6,
       dpi = 400)

ggplot(pesticide_CMR_trend)+
  geom_sf(aes(fill=Estimate_signif), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_void()

ggplot(pesticide_CMR_trend)+
  geom_sf(aes(fill=`Std. Error`), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_void()

ggsave("output/figure_trend_se.png",
       width = 6,
       height = 6,
       dpi = 400)

# technical validation with adonis IFT from solagro https://solagro.org/nos-domaines-d-intervention/agroecologie/carte-pesticides-adonis

## adonis data

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

adonis_df <- read.csv2("/home/rigal/Documents/pesticide/raw_data/pack_solagro_adonis_2021/pack_solagro_adonis_2020-2021_csv_utf8/fr-324510908-adonis-ift-2021-v31082023.csv")
adonis_df$insee_com <- str_pad(adonis_df$insee_com, 5, pad = "0")

adonis_sf <- merge(code_postal_metro,adonis_df, by.x="com_code",by.y="insee_com")
adonis_sf$ift_t <- as.numeric(adonis_sf$ift_t)
adonis_sf$ift_t_hbc <- as.numeric(adonis_sf$ift_t_hbc)

ggplot(adonis_sf)+
  geom_sf(aes(fill=ift_t), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_void()

ggplot(adonis_sf)+
  geom_sf(aes(fill=ift_t), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggplot(adonis_sf)+
  geom_sf(aes(fill=ift_t_hbc), colour=NA) +
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggsave("output/figure_adonis.png",
       width = 6,
       height = 6,
       dpi = 400)


pesticide_CMR_all <- readRDS("output/pesticide_CMR_all.rds")

pesticide_CMR_all_check <- st_transform(adonis_sf,st_crs(pesticide_CMR_all))
pesticide_CMR_all_check <- st_intersection(pesticide_CMR_all,pesticide_CMR_all_check[,c("ift_t","ift_t_hbc")])
pesticide_CMR_all_check$area <- as.numeric(st_area(pesticide_CMR_all_check))
pesticide_CMR_all_check$ift_t_area <- pesticide_CMR_all_check$ift_t*pesticide_CMR_all_check$area
pesticide_CMR_all_check$ift_t_hbc_area <- pesticide_CMR_all_check$ift_t_hbc*pesticide_CMR_all_check$area
pesticide_CMR_all_check_df <- data.frame(data.frame(pesticide_CMR_all_check) %>% group_by(id) %>% summarise(sum_ift_area = sum(ift_t_area, na.rm=TRUE), sum_ift_hbc_area = sum(ift_t_hbc_area, na.rm=TRUE)))
pesticide_CMR_all_check_sf <- pesticide_CMR_all
pesticide_CMR_all_check_sf$area <- as.numeric(st_area(pesticide_CMR_all_check_sf))

pesticide_CMR_all_check_df_toadd <- data.frame(id=which(!(pesticide_CMR_all_check_sf$id %in% pesticide_CMR_all_check_df$id)),sum_ift_area=NA,sum_ift_hbc_area=NA)
pesticide_CMR_all_check_df <- rbind(pesticide_CMR_all_check_df,pesticide_CMR_all_check_df_toadd)
pesticide_CMR_all_check_df <- with(pesticide_CMR_all_check_df, pesticide_CMR_all_check_df[order(id),])

pesticide_CMR_all_check_sf$mean_ift <- pesticide_CMR_all_check_df$sum_ift_area/pesticide_CMR_all_check_sf$area
pesticide_CMR_all_check_sf$mean_ift_hbc <- pesticide_CMR_all_check_df$sum_ift_hbc_area/pesticide_CMR_all_check_sf$area

#saveRDS(pesticide_CMR_all_check_sf,"output/pesticide_CMR_all_check_sf.rds")
pesticide_CMR_all_check_sf <- readRDS("output/pesticide_CMR_all_check_sf.rds")

cor.test(pesticide_CMR_all_check_sf$all_pesticide_exposure,pesticide_CMR_all_check_sf$mean_ift)
cor.test(pesticide_CMR_all_check_sf$mean_concentration_scale,pesticide_CMR_all_check_sf$mean_ift)
cor.test(pesticide_CMR_all_check_sf$mean_itt_scale,pesticide_CMR_all_check_sf$mean_ift)
cor.test(pesticide_CMR_all_check_sf$mean_concentration_scale_water,pesticide_CMR_all_check_sf$mean_ift)
cor.test(pesticide_CMR_all_check_sf$all_pesticide_exposure,pesticide_CMR_all_check_sf$mean_ift_hbc)
cor.test(pesticide_CMR_all_check_sf$mean_concentration_scale,pesticide_CMR_all_check_sf$mean_ift_hbc)
cor.test(pesticide_CMR_all_check_sf$mean_itt_scale,pesticide_CMR_all_check_sf$mean_ift_hbc)
cor.test(pesticide_CMR_all_check_sf$mean_concentration_scale_water,pesticide_CMR_all_check_sf$mean_ift_hbc)


adonis2020_df <- read.csv2("/home/rigal/Documents/pesticide/raw_data/pack_solagro_adonis_2021/pack_solagro_adonis_2020-2021_csv_utf8/fr-324510908-adonis-ift-2020-v31082023.csv")
adonis2020_df$insee_com <- str_pad(adonis2020_df$insee_com, 5, pad = "0")

adonis2020_sf <- merge(code_postal_metro,adonis2020_df, by.x="com_code",by.y="insee_com")
adonis2020_sf$ift_t <- as.numeric(adonis2020_sf$ift_t)
adonis2020_sf$ift_t_hbc <- as.numeric(adonis2020_sf$ift_t_hbc)

pesticide_CMR_all_check2020 <- st_transform(adonis2020_sf,st_crs(pesticide_CMR_all))
pesticide_CMR_all_check2020 <- st_intersection(pesticide_CMR_all,pesticide_CMR_all_check2020[,c("ift_t","ift_t_hbc")])
pesticide_CMR_all_check2020$area <- as.numeric(st_area(pesticide_CMR_all_check2020))
pesticide_CMR_all_check2020$ift_t_area <- pesticide_CMR_all_check2020$ift_t*pesticide_CMR_all_check2020$area
pesticide_CMR_all_check2020$ift_t_hbc_area <- pesticide_CMR_all_check2020$ift_t_hbc*pesticide_CMR_all_check2020$area
pesticide_CMR_all_check2020_df <- data.frame(data.frame(pesticide_CMR_all_check2020) %>% group_by(id) %>% summarise(sum_ift_area = sum(ift_t_area, na.rm=TRUE), sum_ift_hbc_area = sum(ift_t_hbc_area, na.rm=TRUE)))
pesticide_CMR_all_check2020_sf <- pesticide_CMR_all
pesticide_CMR_all_check2020_sf$area <- as.numeric(st_area(pesticide_CMR_all_check2020_sf))

pesticide_CMR_all_check2020_df_toadd <- data.frame(id=which(!(pesticide_CMR_all_check2020_sf$id %in% pesticide_CMR_all_check2020_df$id)),sum_ift_area=NA,sum_ift_hbc_area=NA)
pesticide_CMR_all_check2020_df <- rbind(pesticide_CMR_all_check2020_df,pesticide_CMR_all_check2020_df_toadd)
pesticide_CMR_all_check2020_df <- with(pesticide_CMR_all_check2020_df, pesticide_CMR_all_check2020_df[order(id),])

pesticide_CMR_all_check2020_sf$mean_ift <- pesticide_CMR_all_check2020_df$sum_ift_area/pesticide_CMR_all_check2020_sf$area
pesticide_CMR_all_check2020_sf$mean_ift_hbc <- pesticide_CMR_all_check2020_df$sum_ift_hbc_area/pesticide_CMR_all_check2020_sf$area

#saveRDS(pesticide_CMR_all_check2020_sf,"output/pesticide_CMR_all_check2020_sf.rds")
pesticide_CMR_all_check2020_sf <- readRDS("output/pesticide_CMR_all_check2020_sf.rds")


## map comparison

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")

fr <- st_transform(code_postal[which(!(code_postal$nom_region %in% c("GUYANE","MAYOTTE","GUADELOUPE","MARTINIQUE","REUNION"))),],crs = "EPSG:2154" ) 

pesticide_CMR_all_check_rast <- pesticide_CMR_all_check_sf[,c("all_pesticide_exposure","mean_ift","mean_ift_hbc","mean_itt","mean_concentration_water","mean_concentration")]
pesticide_CMR_all_check_rast$all_pesticide_exposure <- scales::rescale(pesticide_CMR_all_check_rast$all_pesticide_exposure)
pesticide_CMR_all_check_rast$mean_ift <- scales::rescale(pesticide_CMR_all_check_rast$mean_ift)
pesticide_CMR_all_check_rast$mean_ift_hbc <- scales::rescale(pesticide_CMR_all_check_rast$mean_ift_hbc)
pesticide_CMR_all_check_rast$mean_itt <- scales::rescale(pesticide_CMR_all_check_rast$mean_itt)
pesticide_CMR_all_check_rast$mean_concentration_water <- scales::rescale(pesticide_CMR_all_check_rast$mean_concentration_water)
pesticide_CMR_all_check_rast$mean_concentration <- scales::rescale(pesticide_CMR_all_check_rast$mean_concentration)
pesticide_CMR_all_check_rast <- st_rasterize(pesticide_CMR_all_check_rast, st_crop(st_as_stars(st_bbox(fr),dx=10000),fr))
pesticide_CMR_all_check_rast_1000 <- st_rasterize(pesticide_CMR_all_check_rast, st_crop(st_as_stars(st_bbox(fr),dx=1000),fr))
#saveRDS(pesticide_CMR_all_check_rast_1000,"output/pesticide_CMR_all_check_rast_1000.rds")

write_stars(pesticide_CMR_all_check_rast,"output/all_pesticide_exposure.tif",layer = "all_pesticide_exposure")
write_stars(pesticide_CMR_all_check_rast,"output/mean_itt.tif",layer = "mean_itt")
write_stars(pesticide_CMR_all_check_rast,"output/mean_ift.tif",layer = "mean_ift")
write_stars(pesticide_CMR_all_check_rast,"output/mean_ift_hbc.tif",layer = "mean_ift_hbc")

img1 <- terra::rast("output/all_pesticide_exposure.tif")
img2 <- terra::rast("output/mean_ift_hbc.tif")

ssim_raster(img1,img2,w=1)
result_raster <- ssim_raster(img1,img2,w=1,global = FALSE)
levelplot(result_raster)
ggplot() + tidyterra::geom_spatraster(data=result_raster$SSIM)+ scale_fill_gradient2(low = sf.colors(20)[1],mid=sf.colors(20)[10],high=sf.colors(20)[20], na.value = NA, midpoint = 0) +  theme_void()
ggplot() + tidyterra::geom_spatraster(data=result_raster$SIM)+ scale_fill_gradient2(low = sf.colors(20)[1],mid=sf.colors(20)[10],high=sf.colors(20)[20], na.value = NA, midpoint = 0) +  theme_void()
ggplot() + tidyterra::geom_spatraster(data=result_raster$SIV)+ scale_fill_gradient2(low = sf.colors(20)[1],mid=sf.colors(20)[10],high=sf.colors(20)[20], na.value = NA, midpoint = 0) +  theme_void()
ggplot() + tidyterra::geom_spatraster(data=result_raster$SIP)+ scale_fill_gradient2(low = sf.colors(20)[1],mid=sf.colors(20)[10],high=sf.colors(20)[20], na.value = NA, midpoint = 0) +  theme_void()

ggsave("output/figure_ssim.png",
       width = 6,
       height = 6,
       dpi = 400)

diff_img <- img1-img2
ggplot() + tidyterra::geom_spatraster(data=diff_img)+ scale_fill_gradient2(low = sf.colors(20)[1],mid=sf.colors(20)[10],high=sf.colors(20)[20], na.value = NA, midpoint = 0) +  theme_void()


img1$mean_ift_hbc<-img2$mean_ift_hbc

cor_all <- focalPairs(img1,w=3, fun="pearson", na.rm=TRUE)
ggplot() + tidyterra::geom_spatraster(data=cor_all)+ scale_fill_gradientn(colors = sf.colors(20)) +  theme_void()


for(i in 2013:2022){
  print(i)
  
  pesticide_soil_rast_temp <- pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$Annee==i),c("mean_itt")]
  pesticide_soil_rast_temp$mean_itt <- scales::rescale(pesticide_soil_rast_temp$mean_itt)
  pesticide_soil_rast_temp <- st_rasterize(pesticide_soil_rast_temp, st_crop(st_as_stars(st_bbox(fr),dx=20000),fr))
  file_name <- paste0("output/pesticide_soil_rast_",i,".tif")
  write_stars(pesticide_soil_rast_temp,file_name,layer = "mean_itt")
  
  pesticide_air_rast_temp <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==i),c("mean_concentration")]
  pesticide_air_rast_temp$mean_concentration <- scales::rescale(pesticide_air_rast_temp$mean_concentration)
  pesticide_air_rast_temp <- st_rasterize(pesticide_air_rast_temp, st_crop(st_as_stars(st_bbox(fr),dx=20000),fr))
  file_name <- paste0("output/pesticide_air_rast_",i,".tif")
  write_stars(pesticide_air_rast_temp,file_name,layer = "mean_concentration")
  
  pesticide_water_rast_temp <- pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==i),c("mean_concentration")]
  pesticide_water_rast_temp$mean_concentration <- scales::rescale(pesticide_water_rast_temp$mean_concentration)
  pesticide_water_rast_temp <- st_rasterize(pesticide_water_rast_temp, st_crop(st_as_stars(st_bbox(fr),dx=20000),fr))
  file_name <- paste0("output/pesticide_water_rast_",i,".tif")
  write_stars(pesticide_water_rast_temp,file_name,layer = "mean_concentration")
  
}

img1 <- rast("output/pesticide_soil_rast_2013.tif")
img2 <- rast("output/pesticide_air_rast_2013.tif")
img3 <- rast("output/pesticide_water_rast_2013.tif")

img1$pesticide_air_rast_2013<-img2$pesticide_air_rast_2013
img1$pesticide_water_rast_2013<-img3$pesticide_water_rast_2013

cor_2013 <- focalPairs(img1,w=3, fun="pearson", na.rm=TRUE)
ggplot() + tidyterra::geom_spatraster(data=cor_2013)

ssim_raster(img1,img2)
result_raster <- ssim_raster(img1,img2,global = FALSE)
levelplot(result_raster)


### map comparison small agri region  https://agreste.agriculture.gouv.fr/agreste-web/methodon/Z.1/!searchurl/listeTypeMethodon/

pra <- read.csv("raw_data/Referentiel_CommuneRA_PRA_2017.csv", header=TRUE) 


code_postal <- sf::st_read("raw_data/georef-france-commune-arrondissement-municipal-millesime.geojson")
code_postal_2017 <- code_postal[which(code_postal$year==2017),]
code_postal_metro_2017 <- code_postal_2017[which(!(code_postal_2017$reg_name %in% c("Guadeloupe","Martinique","La Réunion","Mayotte","Île de Clipperton",
                                                                               "Guyane","Saint-Pierre-et-Miquelon","Terres australes et antarctiques françaises",
                                                                               "Wallis et Futuna","Saint-Martin","Saint-Barthélemy"))),]

code_postal_metro_2017 <- st_transform(code_postal_metro_2017,crs="EPSG:2154")


#saveRDS(code_postal_metro_2017,"output/code_postal_metro_2017.rds")
code_postal_metro_2017 <- readRDS("output/code_postal_metro_2017.rds")
code_postal_metro_2017 <- code_postal_metro_2017[,c("com_code")]
code_postal_metro_2017$com_code <- unlist(code_postal_metro_2017$com_code)

fr_pra <- merge(code_postal_metro_2017,pra,by.x="com_code",by.y="CODGEO", all.x=TRUE)

fr_pra2 <- fr_pra %>% group_by(PRA_Code) %>% summarise(id="PRA_Code")

ggplot(fr_pra2)+
  geom_sf(aes(fill=PRA_Code), colour=NA) +  theme_void() +
  theme(axis.text=element_blank(),legend.position = "none")

#saveRDS(fr_pra2,"output/fr_pra2.rds")
fr_pra2 <- readRDS("output/fr_pra2.rds")

pesticide_CMR_all <- readRDS("output/pesticide_CMR_all.rds")
pesticide_CMR_all_check_sf <- readRDS("output/pesticide_CMR_all_check_sf.rds")

fr_pra2 <- st_transform(fr_pra2,st_crs(pesticide_CMR_all))

pesticide_CMR_all_check_rast_1000 <- readRDS("output/pesticide_CMR_all_check_rast_1000.rds")
pesticide_CMR_all_check_rast_1000 <- terra::rast(pesticide_CMR_all_check_rast_1000)

fr_pra2$all_pesticide_exposure <- exact_extract(pesticide_CMR_all_check_rast_1000$all_pesticide_exposure_all_pesticide_exposure,fr_pra2,fun="mean")
fr_pra2$mean_ift_hbc <- exact_extract(pesticide_CMR_all_check_rast_1000$mean_ift_hbc_mean_ift_hbc,fr_pra2,fun="mean")
fr_pra2$mean_itt <- exact_extract(pesticide_CMR_all_check_rast_1000$mean_itt_mean_itt,fr_pra2,fun="mean")
fr_pra2$mean_concentration_water <- exact_extract(pesticide_CMR_all_check_rast_1000$mean_concentration_water_mean_concentration_water,fr_pra2,fun="mean")
fr_pra2$mean_concentration <- exact_extract(pesticide_CMR_all_check_rast_1000$mean_concentration_mean_concentration,fr_pra2,fun="mean")


ggplot(fr_pra2)+
  geom_sf(aes(fill=all_pesticide_exposure), colour=NA) +  
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggsave("output/figure_pra_combine_exposure.png",
       width = 6,
       height = 6,
       dpi = 400)

ggplot(fr_pra2)+
  geom_sf(aes(fill=mean_ift_hbc), colour=NA) + 
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20)) +
  theme_void()

ggsave("output/figure_pra_adonis.png",
       width = 6,
       height = 6,
       dpi = 400)

ggplot(fr_pra2)+
  geom_sf(aes(fill=mean_itt), colour=NA) +  
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggsave("output/figure_pra_tii.png",
       width = 6,
       height = 6,
       dpi = 400)

ggplot(fr_pra2)+
  geom_sf(aes(fill=mean_concentration_water), colour=NA) +  
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

ggplot(fr_pra2)+
  geom_sf(aes(fill=mean_concentration), colour=NA) +  
  theme(axis.text=element_blank()) + scale_fill_gradientn(colors = sf.colors(20),transform="sqrt") +
  theme_void()

cor.test(pesticide_CMR_all_check_sf$all_pesticide_exposure,pesticide_CMR_all_check_sf$mean_ift_hbc,method = "spearman")
cor.test(fr_pra2$all_pesticide_exposure,fr_pra2$mean_ift_hbc,method = "spearman")
cor.test(pesticide_CMR_all_check_sf$mean_itt,pesticide_CMR_all_check_sf$mean_ift_hbc,method = "spearman")
cor.test(fr_pra2$mean_itt,fr_pra2$mean_ift_hbc,method = "spearman")
cor.test(fr_pra2$mean_itt,fr_pra2$mean_concentration_water,method = "spearman")
cor.test(fr_pra2$mean_itt,fr_pra2$mean_concentration,method = "spearman")

ggplot(fr_pra2, aes(x=mean_ift_hbc,y=all_pesticide_exposure)) +
  geom_smooth(method = "lm", formula = y~x, 
              se = FALSE, fullrange = TRUE, col="black") +
  geom_point(aes(color = mean_ift_hbc, fill = mean_ift_hbc),
             size = 2.5, alpha = 0.5, 
             shape = 21) +
  scale_fill_gradientn(colors = sf.colors(20)) + 
  annotate("label", label = paste("Spearman's ρ =",
                                  round(cor(fr_pra2$all_pesticide_exposure,fr_pra2$mean_ift_hbc,method = "spearman"),2)),
           x = 0.4, y = 0.5, size = 5, colour = "black") +
  theme_minimal_hgrid(12, rel_small = 1) + ylab("Combined pesticide exposure") + xlab("TFI") +
  theme(legend.position = "none")

ggsave("output/figure_cor_combineexposure_adonis.png",
       width = 7,
       height = 4,
       dpi = 400)

ggplot(fr_pra2, aes(x=mean_ift_hbc,y=mean_itt)) +
  geom_smooth(method = "lm", formula = y~x, 
              se = FALSE, fullrange = TRUE, col="black") +
  geom_point(aes(color = mean_ift_hbc, fill = mean_ift_hbc),
             size = 2.5, alpha = 0.5, 
             shape = 21) +
  scale_fill_gradientn(colors = sf.colors(20)) + 
  annotate("label", label = paste("Spearman's ρ =",
                                  round(cor(fr_pra2$mean_itt,fr_pra2$mean_ift_hbc,method = "spearman"),2)),
           x = 0.4, y = 0.5, size = 5, colour = "black") +
  theme_minimal_hgrid(12, rel_small = 1) + ylab("eTII") + xlab("TFI") +
  theme(legend.position = "none")

ggsave("output/figure_cor_tii_adonis.png",
       width = 7,
       height = 4,
       dpi = 400)

ggplot(fr_pra2, aes(x=mean_concentration_water,y=mean_itt)) +
  geom_smooth(method = "lm", formula = y~x, 
              se = FALSE, fullrange = TRUE, col="black") +
  geom_point(aes(color = mean_ift_hbc, fill = mean_ift_hbc),
             size = 2.5, alpha = 0.5, 
             shape = 21) +
  scale_fill_gradientn(colors = sf.colors(20)) + 
  annotate("label", label = paste("Spearman's ρ =",
                                  round(cor(fr_pra2$mean_itt,fr_pra2$mean_concentration_water,method = "spearman"),2)),
           x = 0.4, y = 0.5, size = 5, colour = "black") +
  theme_minimal_hgrid(12, rel_small = 1) + ylab("eTII") + xlab("Concentration water") +
  theme(legend.position = "none")

### population exposure

pesticide_CMR_all_test <- readRDS("output/pesticide_CMR_all.rds")

pop_com <- read.csv2("raw_data/DS_POPULATIONS_REFERENCE_CSV_FR/DS_POPULATIONS_REFERENCE_data.csv")
pop_com <- pop_com[which(pop_com$GEO_OBJECT == "COM" & pop_com$POPREF_MEASURE=="PMUN" & pop_com$TIME_PERIOD == 2022),]

# from https://public.opendatasoft.com/explore/dataset/georef-france-commune/export/?flg=fr&disjunctive.reg_name&disjunctive.dep_name&disjunctive.arrdep_name&disjunctive.ze2020_name&disjunctive.epci_name&disjunctive.ept_name&disjunctive.com_name&disjunctive.ze2010_name&disjunctive.com_is_mountain_area&disjunctive.bv2022_name
code_postal <- sf::st_read("raw_data/georef-france-commune.geojson")
code_postal <- code_postal[,c("reg_name","com_code")]
code_postal$reg_name <- unlist(code_postal$reg_name)
code_postal$com_code <- unlist(code_postal$com_code)
code_postal <- code_postal[which(!(code_postal$reg_name %in% c("Guadeloupe","Mayotte","Martinique","Guyane","La Réunion",
                                                               "Saint-Martin","Saint-Pierre-et-Miquelon","Terres australes et antarctiques françaises",
                                                               "Wallis et Futuna","Saint-Barthélemy","Île de Clipperton"))),]
pop_com_sf <- merge(code_postal,pop_com,by.x=c("com_code"), by.y=c("GEO"), all.x=TRUE)

pop_com_sf <- st_transform(pop_com_sf, crs = st_crs(pesticide_CMR_all_test))
code_postal_outline <- st_union(pop_com_sf)

saveRDS(pop_com_sf,"output/pop_com_sf.rds")
saveRDS(code_postal_outline,"output/code_postal_outline.rds")

ggplot(pop_com_sf)+
  geom_sf(aes(fill=OBS_VALUE), col=NA) +
  theme(axis.text=element_blank()) +
  scale_fill_gradient(name = "count", trans = "log")

pop_com_pesticide <- st_intersects(pop_com_sf,pesticide_CMR_all_test)

pesticide_mean <- c()
pesticide_sd <- c()
for(i in 1:length(pop_com_pesticide)){
  pesticide_mean[i] <- mean(pesticide_CMR_all_test_df[pop_com_pesticide[[i]],"all_pesticide_exposure"], na.rm=TRUE)
  pesticide_sd[i] <- sd(pesticide_CMR_all_test_df[pop_com_pesticide[[i]],"all_pesticide_exposure"], na.rm=TRUE)
}

pop_com_sf$pesticide_mean <- pesticide_mean
pop_com_sf$pesticide_sd <- pesticide_sd
pop_com_sf$area <- as.numeric(st_area(pop_com_sf))
pop_com_sf$density <- pop_com_sf$OBS_VALUE/(pop_com_sf$area/1000000)

ggplot(pop_com_sf, aes(y=pesticide_mean, x= density)) +
  geom_point()

sum(pop_com_sf$OBS_VALUE[which(pop_com_sf$pesticide_mean > mean(pesticide_CMR_all_test$all_pesticide_exposure, na.rm=TRUE))])/sum(pop_com_sf$OBS_VALUE)

pop_com_sf$increased_health_risk <-  "Lower population or pesticide exposure"
pop_com_sf$increased_health_risk[which(pop_com_sf$pesticide_mean > mean(pesticide_CMR_all_test$all_pesticide_exposure, na.rm=TRUE) & pop_com_sf$density > median(pop_com_sf$density, na.rm=TRUE))] <- "Higher population and pesticide exposure"

ggplot(pop_com_sf) +
  geom_sf(aes(fill=increased_health_risk), col=NA) + scale_fill_manual(values = c("Lower population or pesticide exposure" = "#3E00FFFF",
                                                                                  "Higher population and pesticide exposure" = "#FF936CFF"), name="Health risk") +
  theme(axis.text=element_blank()) +  theme_void()

pop_com_sf_risk <- pop_com_sf[which(pop_com_sf$pesticide_mean > mean(pesticide_CMR_all_test$all_pesticide_exposure, na.rm=TRUE)),]
pop_com_sf_risk <- st_union(pop_com_sf_risk)

ggplot(pop_com_sf)+
  geom_sf(aes(fill=density), col=NA) +
  theme(axis.text=element_blank()) + theme_void() +
  scale_fill_gradient(name = "Population density", trans = "log", breaks=c(10,100,1000)) +
  geom_sf(data=pop_com_sf_risk, fill="white", alpha=0.3)
  

ggsave("output/figure_cpe_population.png",
       width = 7,
       height = 4,
       dpi = 400)

### natura2000

map_protected_area <- sf::st_read("raw_data/zps/zps.shp")
map_protected_area <- st_make_valid(st_transform(map_protected_area, crs = st_crs(pesticide_CMR_all_test)))
map_protected_area_fr <- st_intersection(map_protected_area,code_postal_outline)

saveRDS(map_protected_area_fr,"output/map_protected_area_fr.rds")

map_protected_area_pesticide <- st_intersects(map_protected_area_fr,pesticide_CMR_all_test)
pesticide_CMR_all_test_df <- pesticide_CMR_all_test
st_geometry(pesticide_CMR_all_test_df) <- NULL

pesticide_mean <- c()
pesticide_sd <- c()
for(i in 1:length(map_protected_area_pesticide)){
  pesticide_mean[i] <- mean(pesticide_CMR_all_test_df[map_protected_area_pesticide[[i]],"all_pesticide_exposure"], na.rm=TRUE)
  pesticide_sd[i] <- sd(pesticide_CMR_all_test_df[map_protected_area_pesticide[[i]],"all_pesticide_exposure"], na.rm=TRUE)
}

map_protected_area_fr$pesticide_mean <- pesticide_mean
map_protected_area_fr$pesticide_sd <- pesticide_sd

ggplot(map_protected_area_fr) +
  geom_sf(data=code_postal_outline) +
  geom_sf(aes(fill=pesticide_mean), col=NA) + scale_fill_gradientn(colors = sf.colors(20), transform="sqrt", name="Combined pesticide exposure") +
  theme(axis.text=element_blank()) +  theme_void()

ggsave("output/figure_cpe_natura2000.png",
       width = 7,
       height = 4,
       dpi = 400)

map_protected_area_fr$area <- as.numeric(st_area(map_protected_area_fr))

sum(map_protected_area_fr$area[which(map_protected_area_fr$pesticide_mean > mean(pesticide_CMR_all_test$all_pesticide_exposure, na.rm=TRUE))])/sum(map_protected_area_fr$area)
