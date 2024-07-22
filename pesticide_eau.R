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

