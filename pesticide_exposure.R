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

names(bassin_versant_all_year)[which(!(names(bassin_versant_all_year) %in% subtance_active$Nom.substance.active))][-c(1:17,182)] <- c("Phoxime"               "Chlorméphos"           "Cyfluthrine"           "Acéphate"              "phosmet"              
                                                                                                                                      "Lambda-cyhalothrine"   "Tolylfluanide"         "Dichlofluanide"        "Cyperméthrine"         "Triallate"            
                                                                                                                                      "Bifénox"               "Vinclozoline"          "Flumioxazine"          "Métazachlore"          "Tébuconazole"         
                                                                                                                                      "Zinc"                  "Pendiméthaline"        "Benfluraline"          "Chlorpyriphos-méthyl"  "Bifenthrine"          
                                                                                                                                      "Bromoxynil octanoate"  "Captane"               "Diquat"                "Aclonifène"            "Alpha-cyperméthrine"  
                                                                                                                                      "Lénacile"              "Thirame"               "Butraline"             "Difénoconazole"        "S-Métolachlore"       
                                                                                                                                      "Métamitrone"           "Chlortoluron"          "Métribuzine"           "Diméthénamide"         "Chloridazone"         
                                                                                                                                      "Arsenic"               "Prosulfocarbe"         "Diméthomorphe"         "Chlorprophame"         "Terbutryne"           
                                                                                                                                      "Fenpropidine"          "Diméthoate"            "Mésotrione"            "Carbétamide"           "AZOXYSTROBINE"        
                                                                                                                                      "Pyriméthanil"          "Mécoprop"              "Métalaxyl"             "Fenpropimorphe"        "Mécoprop-P"           
                                                                                                                                      "Pirimicarbe"           "Alachlore"             "Carbendazime"          "Imidaclopride"         "Dinoterbe"            
                                                                                                                                      "Thiophanate-méthyl"    "KRESOXIM-METHYL"       "Chlorpyriphos-éthyl"   "Trifluraline"          "Dinosèbe"             
                                                                                                                                      "asulame"               "Méthomyl"              "Métaldéhyde"           "Piclorame"             "Lufénuron"            
                                                                                                                                      "Dichlorophène"         "Néburon"               "Phenmédiphame"         "Picoxystrobine"        "Triadiménol"          
                                                                                                                                      "Pyraclostrobine"       "Perméthrine"           "Trifloxystrobine"      "Fénitrothion"          "Cycloxydime"          
                                                                                                                                      "Oxydéméton-méthyl"     "Propachlore"           "Méthabenzthiazuron"    "Amétryne"              "Fer"                  
                                                                                                                                      "Triadiméfone"          "Diméthylamine"         "Norflurazone"          "Fénuron"               "Pyridabène"           
                                                                                                                                      "Imazaméthabenz"        "Prométryne"            "Hydrazide maleique"    "Roténone"              "Clofentézine"         
                                                                                                                                      "Fluazifop-P-butyl"     "Pymétrozine"           "Fénazaquin"            "fluridone"             "Métoxuron"            
                                                                                                                                      "Tébufenpyrad"          "Haloxyfop-éthoxyéthyl" "Mépronil"              "Métobromuron"          "Fénarimol"            
                                                                                                                                      "Bendiocarbe"           "Aldicarbe"             "Bénomyl"               "Thiocarbe"             "Naptalame"            
                                                                                                                                      "Chlorthal"             "Buprofézine"           "Desmétryne"            "Quintozène"            "acifluorfen"          
                                                                                                                                      "Deltaméthrine"         "dithianon"             "Oxyfluorfène"          "Chlorthiamide"         "EPTC"                 
                                                                                                                                      "Méthidathion"          "Fenpropathrine"        "Ométhoate"             "Carbophénothion"       "Fluor"                
                                                                                                                                      "Folpel"                "Pyriproxyfène"         "propaquizafop"         "Flamprop-isopropyl"    "Prophame"             
                                                                                                                                      "Séthoxydime"           "Cyhalothrine"          "Terbuphos"             "Fenvalérate"           "Déméton"              
                                                                                                                                      "Indoxacarbe"           "Bioresméthrine"        "Chinométhionate"       "Tralométhrine"         "Fenizon"              
                                                                                                                                      "Tétrachlorvinphos"     "Acibenzolar-S-Methyl"  "Formétanate"           "Acrinathrine"          "Clothianidine"        
                                                                                                                                      "Aluminium"             "Mancozèbe"             "Cyazofamide"           "Prohexadione-calcium"  "Sulfosate"            
                                                                                                                                      "Zirame"                "cinidon-éthyl"         "Mévinphos"             "Difenamide"            "Thiométon"            
                                                                                                                                      "PROQUINAZID"           "Zinèbe"                "Manèbe"                "fluxapyroxade"         "Pyrimiphos-éthyl"     
                                                                                                                                      "Phénol"                "Chlorate de sodium"    "Bromure"               "cyflufénamide"         "Soufre"               
                                                                                                                                      "Trichloronat"          "Fluvalinate"           "Méfentrifluconazole"   "Fluconazole"  )

