# pesticide use
itt_pesticide_year <- readRDS("output/itt_pesticide_year.rds")
# pesticide air
df_sa_year_long <- readRDS("output/df_sa_year_long.rds")
# pesticide water
bassin_versant_all_year <- readRDS("output/bassin_versant_all_year.rds")

# mandatory report
report <- read.csv("raw_data/Redevance_year_2024.csv")
report$X <- NULL

subtance_active <- read.csv2("raw_data/decisionamm-intrant-format-csv-20240710-utf8/substance_active_utf8.csv",header=T)


names(df_sa_year_long)[which(!(names(df_sa_year_long) %in% subtance_active$Nom.substance.active))]

names(df_sa_year_long)[which(!(names(df_sa_year_long) %in% subtance_active$Nom.substance.active))][-c(1:4)] <- c("Abamectin","Azoxystrobin","Bifenthrin","Bromoxynil","Captan",
                                                                                                                 "Chloridazon","Chlorpropham","Chlorthal-dimethyl","Chlortoluron","Clothianidin",
                                                                                                                 "Cyazofamid","Cyfluthrin","Fenhexamid","Fenpropidin","Fenpropimorph",  
                                                                                                                 "Flonicamid","Florasulam","Flumioxazin","Folpet","Imidacloprid",       
                                                                                                                 "Indoxacarb","Picoxystrobin","Propachlor","Prosulfocarb","Pyraclostrobin",     
                                                                                                                 "Thiacloprid","Thiram","Tri-allate","Trifloxystrobin","Trifluralin",       
                                                                                                                 "Ziram")

names(bassin_versant_all_year)[which(!(names(bassin_versant_all_year) %in% subtance_active$Nom.substance.active))]

names(bassin_versant_all_year)[which(!(names(bassin_versant_all_year) %in% subtance_active$Nom.substance.active))][-c(1:17,182)] <- c("Phoxim","Chlormephos","Cyfluthrin","Acephate","Phosmet",
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
names(itt_pesticide_year)[which(!(names(itt_pesticide_year) %in% subtance_active$Nom.substance.active))]

names(itt_pesticide_year)[which(!(names(itt_pesticide_year) %in% subtance_active$Nom.substance.active))][-c(1,2,206)] <- c("(E,Z)-7,9-Dodecadien-1-yl Acetate","Z-13-hexadecen-11-yn-1-yl acetate","Straight Chain Lepidopteran Pheromones","1,3-Dichloropropene","2,4-D","2,4-DB",
                                                                                                                           "MCPA","MCPB","6-Benzyladenine","8-Hydroxyquinoline incl. oxyquinoleine","Abamectin","Acetamiprid",
                                                                                                                           "Acetate de e 8 dodecenyle","Acetate de z 8 dodecenyle","Acibenzolar s methyl","Acide acetique","Acide alpha naphtylacetique ana ","Acide gibberellique",
                                                                                                                           "Acide octanoique","Acide pelargonique","Acide phosphoreux","Acrinathrine","Alpha naphtyl acetamide nad ","Alphamethrine",
                                                                                                                           "Ametoctradine","Aminotriazole","Asulame","Azadirachtine","Azoxystrobine","Bacillus pumilus souche qst 2808",
                                                                                                                           "Bacillus thuringiensis serotype 3a 3b","Bacillus thuringiensis sérotype h 7","Bacillus thuringiensis ssp aizawai souche abts 1857","Beflubutamide","Benfluraline","Benfuracarbe",
                                                                                                                           "Bensulfuron methyl","Betacyfluthrine","Bicarbonate de potassium", "Bifenthrine","Bromoxynil octanoate","Buprofezine",
                                                                                                                           "Butoxyde de piperonyle","Captane","Carfentrazone ethyl","Chlorate de sodium","Chloridazone","Chlormequat chlorure",
                                                                                                                           "Chlorprophame","Chlorpyriphos ethyl","Chlorpyriphos methyl","Chlorthal","Chlorure de choline","Cinidon ethyl",
                                                                                                                           "Cintofen","Clethodime","Clopyralid sous forme de sel de monoethanolamine ","Clothianidine","Cos oga","Cuivre de l hydroxyde de cuivre",
                                                                                                                           "Cuivre de l oxychlorure de cuivre","Cuivre de l oxyde cuivreux","Cuivre du sulfate de cuivre","Cuivre du sulfate tetracuivrique et tricalcique","Cuivre du sulfate tribasique","Cuivre du tallate de cuivre",
                                                                                                                           "Cyanamide de calcium","Cyazofamide","Cycloxydime","Cydia pomonella granulovirus isolat r5 cpgv r5 ","Cyfluthrine","Cyhalofop butyl",
                                                                                                                           "Cypermethrine","Cyprodinyl","Decane 1 ol","Deltamethrine","Dicamba dimethylammonium","Dichlorprop p",
                                                                                                                           "Diclofop methyl","Diflufenicanil","Dimethachlore","Dimethenamide","Dimethenamide p dmta p ","Dimethomorphe",
                                                                                                                           "Diquat","Emamectine benzoate","Esters methyliques d acides gras","Esters methyliques d acides gras c16 c18 et c18 insatures","Extrait d ail","Extrait de fenugrec",
                                                                                                                           "Farine de sang","Fenbutatin oxyde","Fenoxaprop p ethyl","Fenoxycarbe","Fenpicoxamide","Fenpropidine",
                                                                                                                           "Fenpropimorphe","Fer sous forme de sulfate de fer","Flonicamide","Florasulame","Florpyrauxifen benzyl","Fluazifop p butyl",
                                                                                                                           "Flumioxazine","Flupyrsulfuron methyl","Fluroxypyr meptyl","Folpel","Formetanate chlorhydrate","Fosetyl aluminium",
                                                                                                                           "Gamma cyhalothrine","Gibberellines a4 a7 ","Glufosinate ammonium","Halosulfuron methyle","Heptamethyltrisiloxane modifie polyalkylenoxide","Huile d os",
                                                                                                                           "Huile de paraffine","Huile de vaseline","Huile essentielle d orange douce","Huile minerale blanche","Hydrazide maleique","Imidaclopride",
                                                                                                                           "Indoxacarbe","Ioxynil octanoate","Isofetamide","Isoxadifen ethyl","Kaolin","Kresoxim methyl",
                                                                                                                           "Lambda cyhalothrine","Laminarine","Lenacile","Mancozebe","Mandestrobine","Mandipropamide",
                                                                                                                           "Manebe","Mecoprop p mcpp p ","Mefenpyr diethyl","Metalaxyl m","Metam sodium","Metamitrone",
                                                                                                                           "Metazachlore","Methiocarbe","Metirame","Metirame zinc","Metribuzine","Metsulfuron methyl",
                                                                                                                           "Milbemectine","Oxathiapiproline","Oxyfluorfene","Pendimethaline","Penoxsulame","Pethoxamide",
                                                                                                                           "Phenmediphame","Phosphate ferrique","Phosphonate de disodium","Phosphonate de potassium","Phosphure d aluminium","Phosphure de zinc",
                                                                                                                           "Piclorame","Picoxystrobine","Poivre","Prochloraze","Prohexadione calcium","Propachlore",
                                                                                                                           "Propamocarbe","Propamocarbe hcl","Propoxycarbazone sodium","Prosulfocarbe","Pyraclostrobine","Pyraflufen ethyl",
                                                                                                                           "Pyrethrines","Pyridabene","Pyrimicarbe","Pyriproxyfene","Quinoxyfene","Quizalofop p ethyl",
                                                                                                                           "S metolachlore","Sels de potassium d acides gras","Sels de potassium d acides gras c8 c18 ","Soufre","Soufre pour pulverisation micronise ","Soufre sublime",
                                                                                                                           "Soufre triture","Soufre triture ventile","Sulfate de fer sulfate ferreux heptahydrate ","Tau fluvalinate","Tefluthrine","Thiaclopride",
                                                                                                                           "Thiencarbazone methyl","Thifensulfuron methyle","Thiocyanate d ammonium","Thiodicarbe","Thiophanate methyl","Thirame",
                                                                                                                           "Triallate","Tribenuron methyle","Trichoderma asperellum tv1","Trifloxystrobine","Trifluraline","Triflusulfuron methyl",
                                                                                                                           "Trinexapac ethyl","Virus de la granulose","Virus zymv wk","Zetacypermethrine","Zirame")
