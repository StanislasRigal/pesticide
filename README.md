# Pesticides in France: ten years of combined exposure to active substances in land, air and surface water

## Load functions and packages

```{r}

source("package_R.R")

source("functions.R")

```

## Pesticide use

### Load active substance sale data for all regions 

```{r}

# from: https://www.data.gouv.fr/fr/datasets/achats-de-pesticides-par-code-postal/


ara2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2013.csv", header=TRUE)
ara2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2014.csv", header=TRUE)
ara2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2015.csv", header=TRUE)
ara2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2016.csv", header=TRUE)
ara2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2017.csv", header=TRUE)
ara2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2018.csv", header=TRUE)
ara2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2019.csv", header=TRUE)
ara2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2020.csv", header=TRUE)
ara2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2021.csv", header=TRUE)
ara2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_AUVERGNE RHONE ALPES_2022.csv", header=TRUE)
ara <- rbind(ara2013,ara2014,ara2015,ara2016,ara2017,ara2018,ara2019,ara2020,ara2021,ara2022)

bfc2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2013.csv", header=TRUE)
bfc2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2014.csv", header=TRUE)
bfc2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2015.csv", header=TRUE)
bfc2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2016.csv", header=TRUE)
bfc2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2017.csv", header=TRUE)
bfc2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2018.csv", header=TRUE)
bfc2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2019.csv", header=TRUE)
bfc2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2020.csv", header=TRUE)
bfc2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2021.csv", header=TRUE)
bfc2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BOURGOGNE FRANCHE COMTE_2022.csv", header=TRUE)

b2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2013.csv", header=TRUE)
b2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2014.csv", header=TRUE)
b2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2015.csv", header=TRUE)
b2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2016.csv", header=TRUE)
b2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2017.csv", header=TRUE)
b2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2018.csv", header=TRUE)
b2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2019.csv", header=TRUE)
b2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2020.csv", header=TRUE)
b2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2021.csv", header=TRUE)
b2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_BRETAGNE_2022.csv", header=TRUE)

cv2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2013.csv", header=TRUE)
cv2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2014.csv", header=TRUE)
cv2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2015.csv", header=TRUE)
cv2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2016.csv", header=TRUE)
cv2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2017.csv", header=TRUE)
cv2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2018.csv", header=TRUE)
cv2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2019.csv", header=TRUE)
cv2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2020.csv", header=TRUE)
cv2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2021.csv", header=TRUE)
cv2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CENTRE VAL DE LOIRE_2022.csv", header=TRUE)

c2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2013.csv", header=TRUE)
c2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2014.csv", header=TRUE)
c2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2015.csv", header=TRUE)
c2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2016.csv", header=TRUE)
c2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2017.csv", header=TRUE)
c2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2018.csv", header=TRUE)
c2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2019.csv", header=TRUE)
c2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2020.csv", header=TRUE)
c2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2021.csv", header=TRUE)
c2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_CORSE_2022.csv", header=TRUE)

ge2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2013.csv", header=TRUE)
ge2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2014.csv", header=TRUE)
ge2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2015.csv", header=TRUE)
ge2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2016.csv", header=TRUE)
ge2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2017.csv", header=TRUE)
ge2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2018.csv", header=TRUE)
ge2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2019.csv", header=TRUE)
ge2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2020.csv", header=TRUE)
ge2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2021.csv", header=TRUE)
ge2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_GRAND EST_2022.csv", header=TRUE)

hf2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2013.csv", header=TRUE)
hf2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2014.csv", header=TRUE)
hf2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2015.csv", header=TRUE)
hf2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2016.csv", header=TRUE)
hf2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2017.csv", header=TRUE)
hf2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2018.csv", header=TRUE)
hf2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2019.csv", header=TRUE)
hf2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2020.csv", header=TRUE)
hf2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2021.csv", header=TRUE)
hf2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_HAUTS DE FRANCE_2022.csv", header=TRUE)

if2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2013.csv", header=TRUE)
if2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2014.csv", header=TRUE)
if2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2015.csv", header=TRUE)
if2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2016.csv", header=TRUE)
if2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2017.csv", header=TRUE)
if2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2018.csv", header=TRUE)
if2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2019.csv", header=TRUE)
if2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2020.csv", header=TRUE)
if2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2021.csv", header=TRUE)
if2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_ILE DE FRANCE_2022.csv", header=TRUE)

n2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2013.csv", header=TRUE)
n2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2014.csv", header=TRUE)
n2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2015.csv", header=TRUE)
n2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2016.csv", header=TRUE)
n2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2017.csv", header=TRUE)
n2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2018.csv", header=TRUE)
n2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2019.csv", header=TRUE)
n2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2020.csv", header=TRUE)
n2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2021.csv", header=TRUE)
n2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NORMANDIE_2022.csv", header=TRUE)

na2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2013.csv", header=TRUE)
na2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2014.csv", header=TRUE)
na2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2015.csv", header=TRUE)
na2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2016.csv", header=TRUE)
na2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2017.csv", header=TRUE)
na2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2018.csv", header=TRUE)
na2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2019.csv", header=TRUE)
na2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2020.csv", header=TRUE)
na2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2021.csv", header=TRUE)
na2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_NOUVELLE AQUITAINE_2022.csv", header=TRUE)

o2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2013.csv", header=TRUE)
o2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2014.csv", header=TRUE)
o2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2015.csv", header=TRUE)
o2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2016.csv", header=TRUE)
o2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2017.csv", header=TRUE)
o2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2018.csv", header=TRUE)
o2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2019.csv", header=TRUE)
o2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2020.csv", header=TRUE)
o2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2021.csv", header=TRUE)
o2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_OCCITANIE_2022.csv", header=TRUE)

pl2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2013.csv", header=TRUE)
pl2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2014.csv", header=TRUE)
pl2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2015.csv", header=TRUE)
pl2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2016.csv", header=TRUE)
pl2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2017.csv", header=TRUE)
pl2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2018.csv", header=TRUE)
pl2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2019.csv", header=TRUE)
pl2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2020.csv", header=TRUE)
pl2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2021.csv", header=TRUE)
pl2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PAYS DE LA LOIRE_2022.csv", header=TRUE)

pa2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2013.csv", header=TRUE)
pa2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2014.csv", header=TRUE)
pa2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2015.csv", header=TRUE)
pa2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2016.csv", header=TRUE)
pa2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2017.csv", header=TRUE)
pa2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2018.csv", header=TRUE)
pa2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2019.csv", header=TRUE)
pa2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2020.csv", header=TRUE)
pa2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2021.csv", header=TRUE)
pa2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_SUBSTANCE_PROVENCE ALPES COTE D AZUR_2022.csv", header=TRUE)

pesticide_substance_all_region <- rbind(ara2013,ara2014,ara2015,ara2016,ara2017,ara2018,ara2019,ara2020,ara2021,ara2022,
                   bfc2013,bfc2014,bfc2015,bfc2016,bfc2017,bfc2018,bfc2019,bfc2020,bfc2021,bfc2022,
                   b2013,b2014,b2015,b2016,b2017,b2018,b2019,b2020,b2021,b2022,
                   cv2013,cv2014,cv2015,cv2016,cv2017,cv2018,cv2019,cv2020,cv2021,cv2022,
                   c2013,c2014,c2015,c2016,c2017,c2018,c2019,c2020,c2021,c2022,
                   ge2013,ge2014,ge2015,ge2016,ge2017,ge2018,ge2019,ge2020,ge2021,ge2022,
                   hf2013,hf2014,hf2015,hf2016,hf2017,hf2018,hf2019,hf2020,hf2021,hf2022,
                   if2013,if2014,if2015,if2016,if2017,if2018,if2019,if2020,if2021,if2022,
                   n2013,n2014,n2015,n2016,n2017,n2018,n2019,n2020,n2021,n2022,
                   na2013,na2014,na2015,na2016,na2017,na2018,na2019,na2020,na2021,na2022,
                   o2013,o2014,o2015,o2016,o2017,o2018,o2019,o2020,o2021,o2022,
                   pl2013,pl2014,pl2015,pl2016,pl2017,pl2018,pl2019,pl2020,pl2021,pl2022,
                   pa2013,pa2014,pa2015,pa2016,pa2017,pa2018,pa2019,pa2020,pa2021,pa2022)


```

### Specify data type

```{r}

pesticide_substance_all_region[pesticide_substance_all_region=="nc"] <- NA

pesticide_substance_all_region$quantite_substance <- as.numeric(as.character(pesticide_substance_all_region$quantite_substance))

pesticide_substance_all_region$code_postal_acheteur <- as.factor(as.character(pesticide_substance_all_region$code_postal_acheteur))

pesticide_substance_all_region$code_postal_acheteur <- str_pad(pesticide_substance_all_region$code_postal_acheteur, 5, pad = "0")

pesticide_substance_all_region <- pesticide_substance_all_region[which(!is.na(pesticide_substance_all_region$substance)),]

```

### Load geographic and agricultural surface data

```{r}

# from: https://public.opendatasoft.com/explore/dataset/correspondance-code-insee-code-postal/export/

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")


## from: https://www.observatoire-des-territoires.gouv.fr/surface-agricole-utilisee-sau

SAU <- read.csv2("raw_data/agri.csv",header=T)

code_postal_insee <- data.frame(code_postal[,c("insee_com","postal_code","nom_comm","superficie")])

code_postal_insee_SAU <- merge(code_postal_insee,SAU, by.x="insee_com", by.y="codgeo", all.x=TRUE)

code_postal_insee_SAU <- data.frame(code_postal_insee_SAU %>% group_by(postal_code) %>% summarize(superficie_tot=sum(superficie, na.rm=TRUE),
                                                                                                  sau_tot = sum(sau2020, na.rm = TRUE)))

```

### Get regulated usage doses per active substance

#### Regulated usage dose per commercial product

```{r}
# from:  https://www.data.gouv.fr/fr/datasets/donnees-ouvertes-du-catalogue-e-phy-des-produits-phytopharmaceutiques-matieres-fertilisantes-et-supports-de-culture-adjuvants-produits-mixtes-et-melanges/

usage <- read.csv2("raw_data/produits_usages_utf8.csv",header=T)
usage <- droplevels(subset(usage, dose.retenue.unite %in% c("g/ha", "kg/ha", "L/ha","mL/ha")))
usage$dose.retenue <- as.numeric(as.character(usage$dose.retenue))
usage$dose.retenue[usage$dose.retenue.unite=="g/ha"] <- usage$dose.retenue[usage$dose.retenue.unite=="g/ha"]/1000
usage$dose.retenue.unite[usage$dose.retenue.unite=="g/ha"] <- "kg/ha"
usage$dose.retenue[usage$dose.retenue.unite=="mL/ha"] <- usage$dose.retenue[usage$dose.retenue.unite=="mL/ha"]/1000
usage$dose.retenue.unite[usage$dose.retenue.unite=="mL/ha"] <- "L/ha"

usage_produit <- data.frame(usage %>% group_by(numero.AMM,dose.retenue.unite) %>% summarise(dose = min(dose.retenue))) # minimal dose per convention (Pingault et al. 2009)

```

#### Link product with active substance

```{r}

produit <- read.csv2("raw_data/produits_utf8.csv",header=T)

usage_produit_sa <- merge(usage_produit,produit[,c("numero.AMM","Substances.actives")], by="numero.AMM", all.x = TRUE)

```

#### Regulated usage dose per commercial product


```{r}

usage_produit_sa_unique <- usage_produit_sa[grep("\\|", usage_produit_sa$Substances.actives, invert=TRUE),] # get product with only one substance

usage_produit_sa_unique$unite_sa <- str_sub(usage_produit_sa_unique$Substances.actives,-4,-1)
usage_produit_sa_unique$unite_sa[grep("\\%", usage_produit_sa_unique$unite_sa)] <- "%"
usage_produit_sa_unique$unite_sa[grep("g/kg", usage_produit_sa_unique$unite_sa)] <- "g/kg"
usage_produit_sa_unique$unite_sa[grep("g/L", usage_produit_sa_unique$unite_sa)] <- "g/L"
usage_produit_sa_unique$unite_sa[grep("mg/L", usage_produit_sa_unique$unite_sa)] <- "mg/L"
usage_produit_sa_unique <- usage_produit_sa_unique[which(usage_produit_sa_unique$unite_sa %in% c("%","g/kg","g/L","mg/L")),] 

usage_produit_sa_unique$sub_value_sa <- str_sub(usage_produit_sa_unique$Substances.actives,-11,-1)

usage_produit_sa_unique$value_sa <- as.numeric(str_extract(usage_produit_sa_unique$sub_value_sa, "\\d+\\.*\\d*"))

usage_produit_sa_unique$sa_produit <- paste0(usage_produit_sa_unique$unite_sa,sep="_",usage_produit_sa_unique$dose.retenue.unite)

usage_produit_sa_unique <- usage_produit_sa_unique[which(usage_produit_sa_unique$sa_produit %in% c("%_kg/ha","g/kg_kg/ha","g/L_L/ha")),]

usage_produit_sa_unique$dose_homo_sa <- NA
usage_produit_sa_unique$dose_homo_sa[which(usage_produit_sa_unique$sa_produit %in% c("g/kg_kg/ha","g/L_L/ha"))] <- 0.001 * usage_produit_sa_unique$value_sa[which(usage_produit_sa_unique$sa_produit %in% c("g/kg_kg/ha","g/L_L/ha"))] * usage_produit_sa_unique$dose[which(usage_produit_sa_unique$sa_produit %in% c("g/kg_kg/ha","g/L_L/ha"))]
usage_produit_sa_unique$dose_homo_sa[which(usage_produit_sa_unique$sa_produit %in% c("%_kg/ha"))] <- 0.01 * usage_produit_sa_unique$value_sa[which(usage_produit_sa_unique$sa_produit %in% c("%_kg/ha"))] * usage_produit_sa_unique$dose[which(usage_produit_sa_unique$sa_produit %in% c("%_kg/ha"))]


```

### TII per postal code


```{r}

pesticide_pre_itt <- pesticide_substance_all_region[which(pesticide_substance_all_region$amm %in% unique(usage_produit_sa_unique$numero.AMM)),]
pesticide_pre_itt <- merge(pesticide_pre_itt,usage_produit_sa_unique,by.x=c("amm"), by.y=c("numero.AMM"), all.x=TRUE)
pesticide_pre_itt$qsa_dhsa <- pesticide_pre_itt$quantite_substance/pesticide_pre_itt$dose_homo_sa

pesticide_itt_year <- data.frame(pesticide_pre_itt %>% group_by(code_postal_acheteur,annee,substance) %>% summarise(sum_qsa_dhsa = sum(qsa_dhsa, na.rm=T), sum_qsa = sum(quantite_substance, na.rm=T), dose_homo_sa2 = max(dose_homo_sa)))
pesticide_itt_year_sau <- merge(code_postal_insee_SAU,pesticide_itt_year,by.x="postal_code",by.y="code_postal_acheteur")
pesticide_itt_year_sau$itt <- pesticide_itt_year_sau$sum_qsa_dhsa/pesticide_itt_year_sau$sau_tot

qsa_pesticide_year <- dcast(pesticide_itt_year_sau, postal_code + annee ~ substance, value.var = "sum_qsa")
itt_pesticide_year <- dcast(pesticide_itt_year_sau, postal_code + annee ~ substance, value.var = "itt")

qsa_pesticide_year <- data.frame(qsa_pesticide_year %>% complete(postal_code,annee))
itt_pesticide_year <- data.frame(itt_pesticide_year %>% complete(postal_code,annee))


code_postal_unique <- code_postal %>%  group_by(postal_code) %>% summarize(geometry = st_union(geometry))
code_postal_unique$annee <- c(rep(2013:2022,nrow(code_postal_unique)/10),2013)

df_code_postal_unique <- data.frame(code_postal_unique %>% complete(postal_code,annee))[,1:2]
df_code_postal_unique <- merge(code_postal_unique[,c("postal_code")], df_code_postal_unique, by=c("postal_code"))

qsa_pesticide_year <- merge(df_code_postal_unique,qsa_pesticide_year,by=c("postal_code","annee"),all.x=TRUE)
itt_pesticide_year <- merge(df_code_postal_unique,itt_pesticide_year,by=c("postal_code","annee"),all.x=TRUE)

qsa_pesticide_year <- st_transform(qsa_pesticide_year,crs = "EPSG:2154")
itt_pesticide_year <- st_transform(itt_pesticide_year,crs = "EPSG:2154")

```


## Pesticide in air

### Load data from air quality station 

```{r}

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

```