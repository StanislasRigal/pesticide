# Pesticides in France: ten years of combined exposure to active substances in land, air and surface water

## Load functions and packages

```{r}

source("package_R.R")

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

### Geographic and agricultural surface data

#### Load data

```{r}

# from: https://public.opendatasoft.com/explore/dataset/correspondance-code-insee-code-postal/export/

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")


# from: https://www.observatoire-des-territoires.gouv.fr/surface-agricole-utilisee-sau

SAU <- read.csv2("raw_data/agri.csv",header=T)

```

#### Merge data by zip code and municipalities

```{r}

code_postal_insee <- data.frame(code_postal[,c("insee_com","postal_code","nom_comm","superficie")])

code_postal_insee_SAU_init <- merge(code_postal_insee,SAU, by.x="insee_com", by.y="codgeo", all.x=TRUE)

code_postal_insee_SAU <- data.frame(code_postal_insee_SAU_init %>% group_by(postal_code) %>% summarize(superficie_tot=sum(superficie, na.rm=TRUE),
                                                                                                  sau_tot = sum(sau2020, na.rm = TRUE)))



code_postal_insee_SAU_com <- merge(code_postal_insee_SAU_init,code_postal_insee_SAU, by="postal_code", all.x=TRUE)

code_postal_insee_SAU_com$sau2020[which(is.na(code_postal_insee_SAU_com$sau2020))] <- code_postal_insee_SAU_com$sau_tot[which(is.na(code_postal_insee_SAU_com$sau2020))] * code_postal_insee_SAU_com$superficie[which(is.na(code_postal_insee_SAU_com$sau2020))] / code_postal_insee_SAU_com$superficie_tot[which(is.na(code_postal_insee_SAU_com$sau2020))]

code_postal_insee_SAU_com$percent_SAU <- code_postal_insee_SAU_com$sau2020/code_postal_insee_SAU_com$sau_tot

code_postal_insee_SAU_com$percent_surface <- code_postal_insee_SAU_com$superficie/code_postal_insee_SAU_com$superficie_tot

code_postal_insee_SAU_com$geometry <- code_postal_insee_SAU_com$libgeo <- NULL

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

usage_produit <- data.frame(usage %>% group_by(numero.AMM,dose.retenue.unite) %>% summarise(dose = min(dose.retenue))) 

```

#### Link product with active substance

```{r}

# from:  https://www.data.gouv.fr/fr/datasets/donnees-ouvertes-du-catalogue-e-phy-des-produits-phytopharmaceutiques-matieres-fertilisantes-et-supports-de-culture-adjuvants-produits-mixtes-et-melanges/

produit <- read.csv2("raw_data/produits_utf8.csv",header=T)

usage_produit_sa <- merge(usage_produit,produit[,c("numero.AMM","Substances.actives")], by="numero.AMM", all.x = TRUE)

```

#### Regulated usage dose per active substance


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

### eTII per municipality

#### Sold quantity standardised by regulated dose

```{r}

pesticide_pre_tii <- pesticide_substance_all_region[which(pesticide_substance_all_region$amm %in% unique(usage_produit_sa_unique$numero.AMM)),]

pesticide_pre_tii <- merge(pesticide_pre_tii,usage_produit_sa_unique,by.x=c("amm"), by.y=c("numero.AMM"), all.x=TRUE)

pesticide_pre_tii$qsa_dhsa <- pesticide_pre_tii$quantite_substance/pesticide_pre_tii$dose_homo_sa

```


#### Raw sold quantity and sold quantity standardised by regulated dose and zip code total cultivated area

```{r}

pesticide_tii_year <- data.frame(pesticide_pre_tii %>% group_by(code_postal_acheteur,annee,substance) %>% summarise(sum_qsa_dhsa = sum(qsa_dhsa, na.rm=T), sum_qsa = sum(quantite_substance, na.rm=T)))

pesticide_tii_year_sau_com <- merge(code_postal_insee_SAU_com,pesticide_tii_year,by.x="postal_code",by.y="code_postal_acheteur",all.x=TRUE)
pesticide_tii_year_sau_com$sum_qsa_com <- pesticide_tii_year_sau_com$sum_qsa * pesticide_tii_year_sau_com$percent_SAU
pesticide_tii_year_sau_com$sum_qsa_dhas_com <- pesticide_tii_year_sau_com$sum_qsa_dhsa * pesticide_tii_year_sau_com$percent_SAU

qsa_pesticide_year_com <- dcast(pesticide_tii_year_sau_com, insee_com + annee ~ substance, value.var = "sum_qsa_com")
qsa_dhsa_pesticide_year_com <- dcast(pesticide_tii_year_sau_com, insee_com + annee + sau2020 + sau_tot + superficie + superficie_tot ~ substance, value.var = "sum_qsa_dhas_com")

qsa_pesticide_year_com <- data.frame(qsa_pesticide_year_com %>% complete(insee_com,annee))
qsa_dhsa_pesticide_year_com <- data.frame(qsa_dhsa_pesticide_year_com %>% complete(insee_com,annee))

```


#### Complete dataset for all municipality and year between 2013 and 2022

```{r}

code_postal_unique_com <- code_postal
code_postal_unique_com$annee <- c(rep(2013:2022,nrow(code_postal_unique_com)/10),2013,2014)

df_code_postal_unique_com <- data.frame(code_postal_unique_com %>% complete(insee_com,annee))[,1:2]
df_code_postal_unique_com <- merge(code_postal_unique_com[,c("insee_com")], df_code_postal_unique_com, by=c("insee_com"))

qsa_pesticide_year_com <- merge(df_code_postal_unique_com,qsa_pesticide_year_com,by=c("insee_com","annee"),all.x=TRUE)
qsa_dhsa_pesticide_year_com <- merge(df_code_postal_unique_com,qsa_dhsa_pesticide_year_com,by=c("insee_com","annee"),all.x=TRUE)

qsa_pesticide_year_com <- st_transform(qsa_pesticide_year_com,crs = "EPSG:2154")
qsa_dhsa_pesticide_year_com <- st_transform(qsa_dhsa_pesticide_year_com,crs = "EPSG:2154")

```

## Pesticide in air

### Load data from air quality station 

```{r}

# from: https://www.data.gouv.fr/fr/datasets/base-de-donnee-de-surveillance-de-pesticides-dans-l-air-par-les-aasqa-a-partir-de-2002/

pesticide_air_station <- read.csv2("raw_data/pesticides-2002-2022-v03-2024-vf.csv")

pesticide_air_station <- pesticide_air_station[which(!(pesticide_air_station$AASQA %in% c("HAWA MAYOTTE","ATMO REUNION","ATMO GUYANE","MADININAIR","GWADAIR"))),]

pesticide_air_station$Concentration..ng.m3. <- as.numeric(pesticide_air_station$Concentration..ng.m3.)


```

### Geographical data for French municipality

```{r}

# from: https://public.opendatasoft.com/explore/dataset/georef-france-commune-arrondissement-municipal-millesime/export/?disjunctive.reg_name&disjunctive.dep_name&disjunctive.arrdep_name&disjunctive.ze2020_name&disjunctive.bv2012_name&disjunctive.epci_name&disjunctive.ept_name&disjunctive.com_name&disjunctive.com_arm_name&disjunctive.com_arm_is_mountain_area&sort=year&location=6,46.97276,3.93311&basemap=jawg.light

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")

fr <- st_transform(code_postal[which(!(code_postal$nom_region %in% c("GUYANE","MAYOTTE","GUADELOUPE","MARTINIQUE","REUNION"))),],crs = "EPSG:2154" ) 

fr_air_all <- st_as_sf(st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))

```


### Select active substances to keep

```{r}

sa_pesticide <- unique(pesticide_tii_year_sau_com$substance)
molecul_followed <- as.matrix(unique(pesticide_air_station$Substance.active))

match_molecul_sa <- apply(molecul_followed,1,function(x,vect_sa){grep(x,vect_sa,ignore.case = TRUE)},vect_sa=sa_pesticide)

molecul_sa <- unique(pesticide_air_station$Substance.active)[which(sapply(match_molecul_sa, FUN = function(x){!(is.integer(x) && length(x) == 0)}))]

pesticide_air_station_sub <- pesticide_air_station[which(pesticide_air_station$Substance.active %in% molecul_sa),]

```


### Kriging by SA and year

```{r}

fr_air_all_year <- st_as_sf(st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))

for(i in 1:length(unique(pesticide_air_station_sub$Substance.active))){ #
  
  print(i)
  
  sa_name <- unique(pesticide_air_station_sub$Substance.active)[i]
  sa_name_use <- sa_pesticide[unlist(match_molecul_sa[which(unique(pesticide_air_station$Substance.active) == sa_name)])]
  
  pesticide_air_sa <- data.frame(pesticide_air_station_sub[which(pesticide_air_station_sub$Substance.active == sa_name),] %>% group_by(AASQA,Commune,Code.INSEE,xlamb93,ylamb93,Annee) %>% summarize(qte=mean(Concentration..ng.m3., na.rm=TRUE)))
  
  pesticide_air_sa <- pesticide_air_sa[which(pesticide_air_sa$Annee > 2012),]
  
  if(nrow(pesticide_air_sa) > 0){
  
    year_follow <- sort(unique(pesticide_air_sa$Annee))
    
    for(y in year_follow[1]:year_follow[length(year_follow)]){
      
      pesticide_air_sa_y <- pesticide_air_sa[which(pesticide_air_sa$Annee == y),]
      
      pesticide_air_sa_sf <- st_as_sf(pesticide_air_sa_y, crs = "EPSG:2154", coords = c("xlamb93", "ylamb93"))
      
      sa_use <- pesticide_tii_year_sau_com[which(pesticide_tii_year_sau_com$substance %in% sa_name_use & pesticide_tii_year_sau_com$annee == y),]
      sa_use <- sa_use[which(sa_use$sau_tot > 0),]

      sa_use <- data.frame(sa_use %>% group_by(insee_com,superficie) %>% summarize(mean_qsa_com = mean(sum_qsa_com)))
      sa_use$itt_mean <- sa_use$mean_qsa_com/sa_use$superficie
      
      fr_sa_use <- merge(fr,sa_use,by="insee_com", all.x=TRUE)
      fr_sa_use$itt_mean[which(is.na(fr_sa_use$itt_mean))] <- 0
      
      sa_air_use <- st_intersection(pesticide_air_sa_sf,fr_sa_use)
      sa_air_use <- sa_air_use[which(sa_air_use$itt_mean<1),]
      
      if(nrow(sa_air_use) > 9 & max(sa_air_use$qte > 0)){
      
        if(max(sa_air_use$itt_mean) > 0){
          
          vr <- variogram(qte~itt_mean, sa_air_use,cutoff=100000)
          vr.m <- fit.variogram(vr, vgm("Exp"))

          ### Kriging with SA use
          
          grd_sa <- st_rasterize(fr_sa_use, st_crop(st_as_stars(st_bbox(fr),dx = 1000),fr))
          st_crs(grd_sa) <- st_crs(fr_sa_use)
          
          kr <- krige(qte~itt_mean, sa_air_use, grd_sa["itt_mean"], vr.m)
          
        }else{
          
          vr <- variogram(qte~1, sa_air_use,cutoff=100000)
          vr.m <- fit.variogram(vr, vgm("Exp"))

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
}


fr_air_all_year$id <- 1:nrow(fr_air_all_year)

fr_air_all_year_df <- fr_air_all_year

st_geometry(fr_air_all_year_df) <- NULL

fr_air_all_year_df$values <- NULL

```

### Get the complete long format dataset

```{r}

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

## Pesticide in surface water

### Load geographical data on measurement stations and catchment areas

```{r}

# measurment stations

# from:  https://www.sandre.eaufrance.fr/atlas/srv/fre/catalog.search#/metadata/71767e88-a021-4e88-8787-5feed04958d6  (Stations de mesure de la qualité des eaux superficielles continentales (STQ) - Métropole )

station_water <- st_read("raw_data/naiade_all/StationMesureEauxSurface_FXX.gpkg")

station_water_metro <- station_water[which(station_water$CoordYStationMesureEauxSurface>4000000),]

# catchment areas

# from: https://www.sandre.eaufrance.fr/atlas/srv/fre/catalog.search#/metadata/9002f47d-62d2-4bff-b95c-b1dc1b0bd319

bassin_versant <- st_read("raw_data/naiade_all/BassinVersantTopographique_FXX.gpkg")

bassin_versant_fr <- st_transform(bassin_versant,crs = "EPSG:2154" ) 

bassin_versant_all <- bassin_versant_fr %>% mutate() %>% group_by(CdOH) %>% summarize(count=n())


```

### Data on pesticide in surface water

The example is for 2013 as for each year the dataset requires a lot of memory. Repeat the code year by year between 2013 to 2022 while emptying memory each time.

#### Load data (example 2013)

```{r}

# from: https://naiades.eaufrance.fr/france-entiere#/

pesticide_water <- read.csv2("raw_data/naiade_all/analyses_2013.csv")

```

#### Cleaning dataset and quantification (example 2013)

```{r}

# Data provided as correct by laboratories and from the water column

pesticide_water <- pesticide_water[which(pesticide_water$LbQualAna == "Correcte" & pesticide_water$LbSupport == "Eau"),]
gc()

# Get true 0

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

# Handle trace data

pesticide_water_trace <- pesticide_water[which(pesticide_water$MnemoRqAna %in% c("Traces (< seuil de quantification et > seuil de détection)","Résultat < au seuil de quantification")),]
gc()
pesticide_water_trace <- ddply(pesticide_water_trace, .(LbLongParamètre),
                               .fun = function(x,min_threshold){
                                 molecule <- unique(x$LbLongParamètre)
                                 min_threshold_molecule <- min_threshold$min_LqAna[which(min_threshold$LbLongParamètre == molecule)]
                                 return(x[which(x$LqAna == min_threshold_molecule),])
                               }, min_threshold=min_threshold, .progress = "text")
gc()

# Get true quantification

pesticide_water_present <- pesticide_water[which(pesticide_water$MnemoRqAna == "Résultat > seuil de quantification et < au seuil de saturation"),]
rm(pesticide_water)
gc()

pesticide_water_true0$RsAna_interpreted <- 0 # zero if < to the lowest detection threshold
pesticide_water_trace$RsAna_interpreted <- pesticide_water_trace$LdAna # at least detection threshold if < to the minimal quantification threshold
pesticide_water_trace <- pesticide_water_trace[which(!is.na(pesticide_water_trace$RsAna_interpreted)),]
pesticide_water_present$RsAna_interpreted <- pesticide_water_present$RsAna

pesticide_water_quanti <- rbind(pesticide_water_true0,pesticide_water_trace,pesticide_water_present)

```

#### Select active substances to keep and metropolitan measuements (example 2013)

```{r}

usage_produit_sa_unique <- readRDS("output/usage_produit_sa_unique.rds")

sa_pesticide <- unique(usage_produit_sa_unique$Substances.actives)
molecul_followed <- as.matrix(unique(pesticide_water_quanti$LbLongParamètre))

match_molecul_sa <- apply(molecul_followed,1,function(x,vect_sa){grep(x,vect_sa,ignore.case = TRUE)},vect_sa=sa_pesticide)

molecul_sa <- unique(pesticide_water_quanti$LbLongParamètre)[which(sapply(match_molecul_sa, FUN = function(x){!(is.integer(x) && length(x) == 0)}))]

pesticide_water_quanti <- pesticide_water_quanti[which(pesticide_water_quanti$LbLongParamètre %in% molecul_sa),]

# get data for metropole only

pesticide_water_station <- merge(pesticide_water_quanti,station_water_metro[,c("CoordXStationMesureEauxSurface","CoordYStationMesureEauxSurface","CdCommune","CdStationMesureEauxSurface")], by="CdStationMesureEauxSurface")

pesticide_water_station_2013 <- pesticide_water_station

```

### Build the complete dataset

```{r}

to_bind1 <- data.frame(pesticide_water_station_2013,year=2013)
to_bind2 <- data.frame(pesticide_water_station_2014,year=2014)
to_bind3 <- data.frame(pesticide_water_station_2015,year=2015)
to_bind4 <- data.frame(pesticide_water_station_2016,year=2016)
to_bind5 <- data.frame(pesticide_water_station_2017,year=2017)
to_bind6 <- data.frame(pesticide_water_station_2018,year=2018)
to_bind7 <- data.frame(pesticide_water_station_2019,year=2019)
to_bind8 <- data.frame(pesticide_water_station_2020,year=2020)
to_bind9 <- data.frame(pesticide_water_station_2021,year=2021)
to_bind10 <- data.frame(pesticide_water_station_2022,year=2022)

pesticide_water_station_all <- rbind(to_bind1,to_bind2,to_bind3,to_bind4,to_bind5,
                                     to_bind6,to_bind7,to_bind8,to_bind9,to_bind10)


pesticide_water_station_all <- pesticide_water_station_all[which(!(pesticide_water_station_all$LbLongParamètre %in% c("Potassium","Calcium","Sodium",
                                                                                                                      "Sulfates","Ammonium","Cuivre"))),]
pesticide_water_station_all$RsAna <- as.numeric(pesticide_water_station_all$RsAna)
pesticide_water_station_all$RsAna_interpreted <- as.numeric(pesticide_water_station_all$RsAna_interpreted)

pesticide_water_station_simple <- pesticide_water_station_all[,c("CdStationMesureEauxSurface","RsAna","RsAna_interpreted","SymUniteMesure","LbLongParamètre","CoordXStationMesureEauxSurface",
                                                                 "CoordYStationMesureEauxSurface","year")]


```

### Attribute catchment areas to measurments

```{r}

bassin_versant_all_year <- bassin_versant_fr

st_geometry(bassin_versant_all_year) <- NULL

bassin_versant_all_year <- bassin_versant_all_year %>% mutate() %>% group_by(CdOH) %>% summarize(count=n())

bassin_versant_all_year$year <- rep(2013:2022,nrow(bassin_versant_all_year)/10)

bassin_versant_all_year <- bassin_versant_all_year %>% complete(CdOH,year)

bassin_versant_all_year <- merge(bassin_versant_fr,bassin_versant_all_year,by="CdOH")

for(i in 1:length(unique(pesticide_water_station_simple$LbLongParamètre))){
  
  print(i)
  
  sa_name <- unique(pesticide_water_station_simple$LbLongParamètre)[i]
  
  pesticide_water_sa <- data.frame(pesticide_water_station_simple[which(pesticide_water_station_simple$LbLongParamètre == sa_name),] %>% group_by(CdStationMesureEauxSurface,CoordXStationMesureEauxSurface,CoordYStationMesureEauxSurface,SymUniteMesure,year) %>% summarize(qte=mean(RsAna_interpreted, na.rm=TRUE)))
  
  pesticide_water_sa_sf <- st_as_sf(pesticide_water_sa, crs = "EPSG:2154", coords = c("CoordXStationMesureEauxSurface", "CoordYStationMesureEauxSurface"))
  
  bassin_versant_sa <- st_join(bassin_versant_fr,pesticide_water_sa_sf)
  
  bassin_versant_sa <- bassin_versant_sa %>% mutate() %>% group_by(CdOH,year) %>%  summarise(qte_mean=mean(qte,na.rm=TRUE))
  
  st_geometry(bassin_versant_sa) <- NULL
  
  bassin_versant_sa <- data.frame(bassin_versant_sa)
  
  bassin_versant_all_year <- merge(bassin_versant_all_year, bassin_versant_sa, by=c("CdOH","year"), all.x=TRUE)
  
  names(bassin_versant_all_year)[which(names(bassin_versant_all_year) == "qte_mean")] <- sa_name
  
}

```


## Combined pesticide exposure

### Load active substance (AS) reporting status
        
```{r}

report <- read.csv("raw_data/Redevance_year_2024.csv")
report$X <- NULL

substance_active <- read.csv2("raw_data/decisionamm-intrant-format-csv-20240710-utf8/substance_active_utf8.csv",header=T)

```


### Homogeneise AS names for use, air and water datasets

#### AS in air

```{r}

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
                                                                                                                  
                                                                                                                  
```


#### AS in surface water

```{r}

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

```


#### AS in use

```{r}

names(qsa_dhsa_pesticide_year_com) <- gsub('\\.', ' ', names(qsa_dhsa_pesticide_year_com))

foo <- function(x){
  paste(toupper(substring(x, 1, 1)),
        tolower(substring(x, 2, nchar(x))),
        sep = "")}
        
names(qsa_dhsa_pesticide_year_com)[-c(353:354)] <- foo(names(qsa_dhsa_pesticide_year_com)[-c(353:354)])

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

```

### AS mandatory to report between 2013 and 2022 (similar to 2021) 

```{r}

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

```

### Build dataset for 'Active substances in use, quantity, air and water'

```{r}

pesticide_soil <- qsa_dhsa_pesticide_year_com[,c(1,2,which(names(qsa_dhsa_pesticide_year_com) %in% mandatory_all))]
names(pesticide_soil)[1:2] <- c("geo_id","year")

pesticide_air <- df_sa_year_long[,c(1,2,which(names(df_sa_year_long) %in% mandatory_all))]
names(pesticide_air)[1:2] <- c("geo_id","year")

pesticide_water <- bassin_versant_all_year[,c(1,2,which(names(bassin_versant_all_year) %in% mandatory_all))]
names(pesticide_water)[1:2] <- c("geo_id","year")

Active_substances_in_use <- pesticide_soil

Active_substances_in_air <- pesticide_air

Active_substances_in_water <- pesticide_water

```

### Get toxic or carcinogenic, mutagenic, reprotoxic AS

```{r}

sa_class <- unique(pesticide_pre_itt[c('substance', "cas",'classification')])

sa_TTCMR <- sa_class[which(sa_class$classification %in% c("T, T+, CMR","Env A","Env B", "Santé A", "CMR")),]

sa_TTCMR <- unique(sa_TTCMR[c('substance', "cas")])

sa_TTCMR_mandatory <- merge(sa_TTCMR, mandatory_all_CAS, by.x="cas",by.y="CAS_number")

```


### Select data for toxic or carcinogenic, mutagenic, reprotoxic AS

```{r}

pesticide_soil_CMR <- qsa_dhsa_pesticide_year_com[,c(1:6,which(names(qsa_dhsa_pesticide_year_com) %in% sa_TTCMR_mandatory))]

pesticide_air_CMR <- df_sa_year_long[,c(1,2,which(names(df_sa_year_long) %in% mandatory_all & sa_TTCMR_mandatory))]

pesticide_water_CMR <- bassin_versant_all_year[,c(1,2,which(names(bassin_versant_all_year) %in% sa_TTCMR_mandatory))]

```

### Average combined pesticide exposure map

#### Average map for use

```{r}

average_soil_CMR <- pesticide_soil_CMR

st_geometry(average_soil_CMR) <- NULL

average_soil_CMR <- apply(average_soil_CMR[,-c(1:6)], 1, function(x){sum(x, na.rm=TRUE)})

pesticide_soil_CMR$all_qsa <- average_soil_CMR

pesticide_soil_CMR$all_tii <- pesticide_soil_CMR$all_qsa/pesticide_soil_CMR$Superficie

pesticide_soil_CMR_average <- st_as_sf(data.frame(pesticide_soil_CMR %>% group_by(Insee_com) %>% summarise(mean_qsa = mean(all_qsa, na.rm=T), mean_tii = mean(all_tii, na.rm=T))))


# remove extreme values and rescale values

threshold_soil <- quantile(pesticide_soil_CMR_average$mean_qsa,0.995 ,na.rm = TRUE)

pesticide_soil_CMR_average$mean_qsa[which(pesticide_soil_CMR_average$mean_qsa>threshold_soil)] <- threshold_soil

pesticide_soil_CMR_average$mean_qsa_scale <- scales::rescale(pesticide_soil_CMR_average$mean_qsa)

threshold_soil <- quantile(pesticide_soil_CMR_average$mean_tii,0.995 ,na.rm = TRUE)

pesticide_soil_CMR_average$mean_tii[which(pesticide_soil_CMR_average$mean_tii>threshold_soil)] <- threshold_soil

pesticide_soil_CMR_average$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average$mean_tii)

pesticide_soil_CMR_average <- pesticide_soil_CMR_average[which(str_sub(pesticide_soil_CMR_average$Insee_com,1,2) != "97"),]

```

#### Average map for air concentration

```{r}

average_air_CMR <- pesticide_air_CMR

st_geometry(average_air_CMR) <- NULL

average_air_CMR <- apply(average_air_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})

average_air_CMR[average_air_CMR<0] <- 0

pesticide_air_CMR$Concentration_total <- average_air_CMR

pesticide_air_CMR_average <- st_as_sf(data.frame(data.frame(pesticide_air_CMR) %>% group_by(id,geometry) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))

# remove extreme values and rescale values

threshold_air <- quantile(pesticide_air_CMR_average$mean_concentration,0.995)

pesticide_air_CMR_average$mean_concentration[which(pesticide_air_CMR_average$mean_concentration>threshold_air)] <- threshold_air

pesticide_air_CMR_average$mean_concentration_scale <- scales::rescale(pesticide_air_CMR_average$mean_concentration)

```

#### Average map for water concentration

```{r}

average_water_CMR <- pesticide_water_CMR

st_geometry(average_water_CMR) <- NULL

average_water_CMR <- apply(average_water_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})

pesticide_water_CMR$Concentration_total <- average_water_CMR

pesticide_water_CMR_average <- st_as_sf(data.frame(pesticide_water_CMR %>% group_by(CdOH) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))


# remove extreme values and rescale values

threshold_water <- quantile(pesticide_water_CMR_average$mean_concentration,0.995)

pesticide_water_CMR_average$mean_concentration[which(pesticide_water_CMR_average$mean_concentration>threshold_water)] <- threshold_water

pesticide_water_CMR_average$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average$mean_concentration)

```


#### Standardise values of each average maps between 0 and 1 using the double of the maximal observed value

```{r}

max_soil <- max(na.omit(pesticide_soil_CMR_average$mean_tii))*2

max_air <- max(pesticide_air_CMR_average$mean_concentration)*2

max_water <- max(pesticide_water_CMR_average$mean_concentration)*2


pesticide_CMR_all <- pesticide_air_CMR_average

pesticide_CMR_all$mean_concentration_scale <- scales::rescale(pesticide_CMR_all$mean_concentration, from=c(0,max_air))


pesticide_soil_CMR_average <- st_transform(pesticide_soil_CMR_average,st_crs(pesticide_CMR_all))

pesticide_soil_CMR_average$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average$mean_tii, from = c(0,max_soil))

pesticide_water_CMR_average <- st_transform(pesticide_water_CMR_average,st_crs(pesticide_CMR_all))

pesticide_soil_CMR_average$mean_concentration_scale <- scales::rescale(pesticide_soil_CMR_average$mean_concentration, from = c(0,max_water))

```


#### Combined exposure to active substance in use, air and water

```{r}

# Intersect 1x1 km grid (air concentration) with municipalities (eTII) 

pesticide_CMR_all_df <- st_intersection(pesticide_CMR_all,pesticide_soil_CMR_average[,c("mean_tii","mean_tii_scale")])

pesticide_CMR_all_df$area <- as.numeric(st_area(pesticide_CMR_all_df))

pesticide_CMR_all_df$mean_tii_area <- pesticide_CMR_all_df$mean_tii*pesticide_CMR_all_df$area

pesticide_CMR_all_df$mean_tii_scale_area <- pesticide_CMR_all_df$mean_tii_scale*pesticide_CMR_all_df$area

pesticide_CMR_all_df <- data.frame(data.frame(pesticide_CMR_all_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))

pesticide_CMR_all$area <- as.numeric(st_area(pesticide_CMR_all))

pesticide_CMR_all$mean_tii <- pesticide_CMR_all_df$sum_tii_area/pesticide_CMR_all$area

pesticide_CMR_all$mean_tii_scale <- pesticide_CMR_all_df$sum_tii_scale_area/pesticide_CMR_all$area


# Intersect 1x1 km grid (air concentration) with catchment areas (water concentration) 

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


# Combine pesticide exposure

pesticide_CMR_all$all_pesticide_exposure <- pesticide_CMR_all$mean_concentration_scale + pesticide_CMR_all$mean_tii_scale + pesticide_CMR_all$mean_concentration_scale_water

Combined_exposure_to_active_substance_in_use_air_and_water <- pesticide_CMR_all

```

## Yearly combined pesticide exposure

### Average by year

#### AS use

```{r}

average_soil_CMR <- pesticide_soil_CMR

st_geometry(average_soil_CMR) <- NULL

iit_CMR <- apply(average_soil_CMR[,-c(1:6)], 2, function(x,div){x/div}, div=average_soil_CMR$Superficie)

pesticide_soil_CMR[,7:(ncol(pesticide_soil_CMR)-1)] <- iit_CMR

average_soil_CMR <- apply(iit_CMR, 1, function(x){sum(x, na.rm=TRUE)})

pesticide_soil_CMR$all_tii <- average_soil_CMR

pesticide_soil_CMR_average_year <- st_as_sf(data.frame(data.frame(pesticide_soil_CMR) %>% group_by(Insee_com,geometry,Annee) %>% summarise(mean_tii = mean(all_tii, na.rm=T))))

threshold_soil <- quantile(pesticide_soil_CMR_average_year$mean_tii,0.995 ,na.rm = TRUE)

pesticide_soil_CMR_average_year$mean_tii[which(pesticide_soil_CMR_average_year$mean_tii>threshold_soil)] <- threshold_soil

names(pesticide_soil_CMR_average_year)[2] <- "year"

pesticide_soil_CMR_average_year <- pesticide_soil_CMR_average_year[which(str_sub(pesticide_soil_CMR_average_year$Insee_com,1,2) != "97"),]

```

#### Air concentration

```{r}

average_air_CMR <- pesticide_air_CMR

st_geometry(average_air_CMR) <- NULL

average_air_CMR <- apply(average_air_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})

average_air_CMR[average_air_CMR<0] <- 0

pesticide_air_CMR$Concentration_total <- average_air_CMR

pesticide_air_CMR_average_year <- st_as_sf(data.frame(data.frame(pesticide_air_CMR) %>% group_by(id,geometry,year) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))

threshold_air <- quantile(pesticide_air_CMR_average_year$mean_concentration,0.995)

pesticide_air_CMR_average_year$mean_concentration[which(pesticide_air_CMR_average_year$mean_concentration>threshold_air)] <- threshold_air

```

#### Water concentration

```{r}

average_water_CMR <- pesticide_water_CMR

st_geometry(average_water_CMR) <- NULL

average_water_CMR <- apply(average_water_CMR[,-c(1,2)], 1, function(x){sum(x, na.rm=TRUE)})

pesticide_water_CMR$Concentration_total <- average_water_CMR

pesticide_water_CMR_average_year <- st_as_sf(data.frame(data.frame(pesticide_water_CMR) %>% group_by(CdOH,geometry,year) %>% summarise(mean_concentration = mean(Concentration_total, na.rm=T))))

threshold_water <- quantile(pesticide_water_CMR_average_year$mean_concentration,0.995)

pesticide_water_CMR_average_year$mean_concentration[which(pesticide_water_CMR_average_year$mean_concentration>threshold_water)] <- threshold_water

```

#### Standardise values of each average maps between 0 and 1 using the double of the maximal observed value

```{r}

max_soil <- max(na.omit(pesticide_soil_CMR_average_year$mean_tii))*2

max_air <- max(pesticide_air_CMR_average_year$mean_concentration)*2

max_water <- max(pesticide_water_CMR_average_year$mean_concentration)*2

```

#### Value for 2013

```{r}

pesticide_CMR_2013 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2013),]
pesticide_CMR_2013$mean_concentration_scale <- scales::rescale(pesticide_CMR_2013$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2013 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2013),],st_crs(pesticide_CMR_2013))
pesticide_soil_CMR_average_2013$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2013$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2013 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2013),],st_crs(pesticide_CMR_2013))
pesticide_water_CMR_average_2013$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2013$mean_concentration, from = c(0,max_water))

pesticide_CMR_2013_df <- st_intersection(pesticide_CMR_2013,pesticide_soil_CMR_average_2013[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2013_df$area <- as.numeric(st_area(pesticide_CMR_2013_df))
pesticide_CMR_2013_df$mean_tii_area <- pesticide_CMR_2013_df$mean_tii*pesticide_CMR_2013_df$area
pesticide_CMR_2013_df$mean_tii_scale_area <- pesticide_CMR_2013_df$mean_tii_scale*pesticide_CMR_2013_df$area
pesticide_CMR_2013_df <- data.frame(data.frame(pesticide_CMR_2013_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2013$area <- as.numeric(st_area(pesticide_CMR_2013))
pesticide_CMR_2013$mean_tii <- pesticide_CMR_2013_df$sum_tii_area/pesticide_CMR_2013$area
pesticide_CMR_2013$mean_tii_scale <- pesticide_CMR_2013_df$sum_tii_scale_area/pesticide_CMR_2013$area

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

pesticide_CMR_2013$all_pesticide_exposure <- pesticide_CMR_2013$mean_concentration_scale + pesticide_CMR_2013$mean_tii_scale + pesticide_CMR_2013$mean_concentration_scale_water

```

#### Value for 2014

```{r}

pesticide_CMR_2014 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2014),]
pesticide_CMR_2014$mean_concentration_scale <- scales::rescale(pesticide_CMR_2014$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2014 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2014),],st_crs(pesticide_CMR_2014))
pesticide_soil_CMR_average_2014$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2014$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2014 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2014),],st_crs(pesticide_CMR_2014))
pesticide_water_CMR_average_2014$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2014$mean_concentration, from = c(0,max_water))

pesticide_CMR_2014_df <- st_intersection(pesticide_CMR_2014,pesticide_soil_CMR_average_2014[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2014_df$area <- as.numeric(st_area(pesticide_CMR_2014_df))
pesticide_CMR_2014_df$mean_tii_area <- pesticide_CMR_2014_df$mean_tii*pesticide_CMR_2014_df$area
pesticide_CMR_2014_df$mean_tii_scale_area <- pesticide_CMR_2014_df$mean_tii_scale*pesticide_CMR_2014_df$area
pesticide_CMR_2014_df <- data.frame(data.frame(pesticide_CMR_2014_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2014$area <- as.numeric(st_area(pesticide_CMR_2014))
pesticide_CMR_2014$mean_tii <- pesticide_CMR_2014_df$sum_tii_area/pesticide_CMR_2014$area
pesticide_CMR_2014$mean_tii_scale <- pesticide_CMR_2014_df$sum_tii_scale_area/pesticide_CMR_2014$area

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

pesticide_CMR_2014$all_pesticide_exposure <- pesticide_CMR_2014$mean_concentration_scale + pesticide_CMR_2014$mean_tii_scale + pesticide_CMR_2014$mean_concentration_scale_water

```

#### Value for 2015

```{r}

pesticide_CMR_2015 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2015),]
pesticide_CMR_2015$mean_concentration_scale <- scales::rescale(pesticide_CMR_2015$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2015 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2015),],st_crs(pesticide_CMR_2015))
pesticide_soil_CMR_average_2015$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2015$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2015 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2015),],st_crs(pesticide_CMR_2015))
pesticide_water_CMR_average_2015$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2015$mean_concentration, from = c(0,max_water))

pesticide_CMR_2015_df <- st_intersection(pesticide_CMR_2015,pesticide_soil_CMR_average_2015[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2015_df$area <- as.numeric(st_area(pesticide_CMR_2015_df))
pesticide_CMR_2015_df$mean_tii_area <- pesticide_CMR_2015_df$mean_tii*pesticide_CMR_2015_df$area
pesticide_CMR_2015_df$mean_tii_scale_area <- pesticide_CMR_2015_df$mean_tii_scale*pesticide_CMR_2015_df$area
pesticide_CMR_2015_df <- data.frame(data.frame(pesticide_CMR_2015_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2015$area <- as.numeric(st_area(pesticide_CMR_2015))
pesticide_CMR_2015$mean_tii <- pesticide_CMR_2015_df$sum_tii_area/pesticide_CMR_2015$area
pesticide_CMR_2015$mean_tii_scale <- pesticide_CMR_2015_df$sum_tii_scale_area/pesticide_CMR_2015$area

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

pesticide_CMR_2015$all_pesticide_exposure <- pesticide_CMR_2015$mean_concentration_scale + pesticide_CMR_2015$mean_tii_scale + pesticide_CMR_2015$mean_concentration_scale_water

```

#### Value for 2016

```{r}

pesticide_CMR_2016 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2016),]
pesticide_CMR_2016$mean_concentration_scale <- scales::rescale(pesticide_CMR_2016$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2016 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2016),],st_crs(pesticide_CMR_2016))
pesticide_soil_CMR_average_2016$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2016$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2016 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2016),],st_crs(pesticide_CMR_2016))
pesticide_water_CMR_average_2016$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2016$mean_concentration, from = c(0,max_water))

pesticide_CMR_2016_df <- st_intersection(pesticide_CMR_2016,pesticide_soil_CMR_average_2016[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2016_df$area <- as.numeric(st_area(pesticide_CMR_2016_df))
pesticide_CMR_2016_df$mean_tii_area <- pesticide_CMR_2016_df$mean_tii*pesticide_CMR_2016_df$area
pesticide_CMR_2016_df$mean_tii_scale_area <- pesticide_CMR_2016_df$mean_tii_scale*pesticide_CMR_2016_df$area
pesticide_CMR_2016_df <- data.frame(data.frame(pesticide_CMR_2016_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2016$area <- as.numeric(st_area(pesticide_CMR_2016))
pesticide_CMR_2016$mean_tii <- pesticide_CMR_2016_df$sum_tii_area/pesticide_CMR_2016$area
pesticide_CMR_2016$mean_tii_scale <- pesticide_CMR_2016_df$sum_tii_scale_area/pesticide_CMR_2016$area

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

pesticide_CMR_2016$all_pesticide_exposure <- pesticide_CMR_2016$mean_concentration_scale + pesticide_CMR_2016$mean_tii_scale + pesticide_CMR_2016$mean_concentration_scale_water

```

#### Value for 2017

```{r}

pesticide_CMR_2017 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2017),]
pesticide_CMR_2017$mean_concentration_scale <- scales::rescale(pesticide_CMR_2017$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2017 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2017),],st_crs(pesticide_CMR_2017))
pesticide_soil_CMR_average_2017$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2017$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2017 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2017),],st_crs(pesticide_CMR_2017))
pesticide_water_CMR_average_2017$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2017$mean_concentration, from = c(0,max_water))

pesticide_CMR_2017_df <- st_intersection(pesticide_CMR_2017,pesticide_soil_CMR_average_2017[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2017_df$area <- as.numeric(st_area(pesticide_CMR_2017_df))
pesticide_CMR_2017_df$mean_tii_area <- pesticide_CMR_2017_df$mean_tii*pesticide_CMR_2017_df$area
pesticide_CMR_2017_df$mean_tii_scale_area <- pesticide_CMR_2017_df$mean_tii_scale*pesticide_CMR_2017_df$area
pesticide_CMR_2017_df <- data.frame(data.frame(pesticide_CMR_2017_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2017$area <- as.numeric(st_area(pesticide_CMR_2017))
pesticide_CMR_2017$mean_tii <- pesticide_CMR_2017_df$sum_tii_area/pesticide_CMR_2017$area
pesticide_CMR_2017$mean_tii_scale <- pesticide_CMR_2017_df$sum_tii_scale_area/pesticide_CMR_2017$area

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

pesticide_CMR_2017$all_pesticide_exposure <- pesticide_CMR_2017$mean_concentration_scale + pesticide_CMR_2017$mean_tii_scale + pesticide_CMR_2017$mean_concentration_scale_water

```

#### Value for 2018

```{r}

pesticide_CMR_2018 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2018),]
pesticide_CMR_2018$mean_concentration_scale <- scales::rescale(pesticide_CMR_2018$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2018 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2018),],st_crs(pesticide_CMR_2018))
pesticide_soil_CMR_average_2018$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2018$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2018 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2018),],st_crs(pesticide_CMR_2018))
pesticide_water_CMR_average_2018$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2018$mean_concentration, from = c(0,max_water))

pesticide_CMR_2018_df <- st_intersection(pesticide_CMR_2018,pesticide_soil_CMR_average_2018[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2018_df$area <- as.numeric(st_area(pesticide_CMR_2018_df))
pesticide_CMR_2018_df$mean_tii_area <- pesticide_CMR_2018_df$mean_tii*pesticide_CMR_2018_df$area
pesticide_CMR_2018_df$mean_tii_scale_area <- pesticide_CMR_2018_df$mean_tii_scale*pesticide_CMR_2018_df$area
pesticide_CMR_2018_df <- data.frame(data.frame(pesticide_CMR_2018_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2018$area <- as.numeric(st_area(pesticide_CMR_2018))
pesticide_CMR_2018$mean_tii <- pesticide_CMR_2018_df$sum_tii_area/pesticide_CMR_2018$area
pesticide_CMR_2018$mean_tii_scale <- pesticide_CMR_2018_df$sum_tii_scale_area/pesticide_CMR_2018$area

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

pesticide_CMR_2018$all_pesticide_exposure <- pesticide_CMR_2018$mean_concentration_scale + pesticide_CMR_2018$mean_tii_scale + pesticide_CMR_2018$mean_concentration_scale_water

```

#### Value for 2019

```{r}

pesticide_CMR_2019 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2019),]
pesticide_CMR_2019$mean_concentration_scale <- scales::rescale(pesticide_CMR_2019$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2019 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2019),],st_crs(pesticide_CMR_2019))
pesticide_soil_CMR_average_2019$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2019$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2019 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2019),],st_crs(pesticide_CMR_2019))
pesticide_water_CMR_average_2019$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2019$mean_concentration, from = c(0,max_water))

pesticide_CMR_2019_df <- st_intersection(pesticide_CMR_2019,pesticide_soil_CMR_average_2019[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2019_df$area <- as.numeric(st_area(pesticide_CMR_2019_df))
pesticide_CMR_2019_df$mean_tii_area <- pesticide_CMR_2019_df$mean_tii*pesticide_CMR_2019_df$area
pesticide_CMR_2019_df$mean_tii_scale_area <- pesticide_CMR_2019_df$mean_tii_scale*pesticide_CMR_2019_df$area
pesticide_CMR_2019_df <- data.frame(data.frame(pesticide_CMR_2019_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2019$area <- as.numeric(st_area(pesticide_CMR_2019))
pesticide_CMR_2019$mean_tii <- pesticide_CMR_2019_df$sum_tii_area/pesticide_CMR_2019$area
pesticide_CMR_2019$mean_tii_scale <- pesticide_CMR_2019_df$sum_tii_scale_area/pesticide_CMR_2019$area

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

pesticide_CMR_2019$all_pesticide_exposure <- pesticide_CMR_2019$mean_concentration_scale + pesticide_CMR_2019$mean_tii_scale + pesticide_CMR_2019$mean_concentration_scale_water

```

#### Value for 2020

```{r}

pesticide_CMR_2020 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2020),]
pesticide_CMR_2020$mean_concentration_scale <- scales::rescale(pesticide_CMR_2020$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2020 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2020),],st_crs(pesticide_CMR_2020))
pesticide_soil_CMR_average_2020$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2020$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2020 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2020),],st_crs(pesticide_CMR_2020))
pesticide_water_CMR_average_2020$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2020$mean_concentration, from = c(0,max_water))

pesticide_CMR_2020_df <- st_intersection(pesticide_CMR_2020,pesticide_soil_CMR_average_2020[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2020_df$area <- as.numeric(st_area(pesticide_CMR_2020_df))
pesticide_CMR_2020_df$mean_tii_area <- pesticide_CMR_2020_df$mean_tii*pesticide_CMR_2020_df$area
pesticide_CMR_2020_df$mean_tii_scale_area <- pesticide_CMR_2020_df$mean_tii_scale*pesticide_CMR_2020_df$area
pesticide_CMR_2020_df <- data.frame(data.frame(pesticide_CMR_2020_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2020$area <- as.numeric(st_area(pesticide_CMR_2020))
pesticide_CMR_2020$mean_tii <- pesticide_CMR_2020_df$sum_tii_area/pesticide_CMR_2020$area
pesticide_CMR_2020$mean_tii_scale <- pesticide_CMR_2020_df$sum_tii_scale_area/pesticide_CMR_2020$area

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

pesticide_CMR_2020$all_pesticide_exposure <- pesticide_CMR_2020$mean_concentration_scale + pesticide_CMR_2020$mean_tii_scale + pesticide_CMR_2020$mean_concentration_scale_water

```

#### Value for 2021

```{r}

pesticide_CMR_2021 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2021),]
pesticide_CMR_2021$mean_concentration_scale <- scales::rescale(pesticide_CMR_2021$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2021 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2021),],st_crs(pesticide_CMR_2021))
pesticide_soil_CMR_average_2021$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2021$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2021 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2021),],st_crs(pesticide_CMR_2021))
pesticide_water_CMR_average_2021$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2021$mean_concentration, from = c(0,max_water))

pesticide_CMR_2021_df <- st_intersection(pesticide_CMR_2021,pesticide_soil_CMR_average_2021[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2021_df$area <- as.numeric(st_area(pesticide_CMR_2021_df))
pesticide_CMR_2021_df$mean_tii_area <- pesticide_CMR_2021_df$mean_tii*pesticide_CMR_2021_df$area
pesticide_CMR_2021_df$mean_tii_scale_area <- pesticide_CMR_2021_df$mean_tii_scale*pesticide_CMR_2021_df$area
pesticide_CMR_2021_df <- data.frame(data.frame(pesticide_CMR_2021_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2021$area <- as.numeric(st_area(pesticide_CMR_2021))
pesticide_CMR_2021$mean_tii <- pesticide_CMR_2021_df$sum_tii_area/pesticide_CMR_2021$area
pesticide_CMR_2021$mean_tii_scale <- pesticide_CMR_2021_df$sum_tii_scale_area/pesticide_CMR_2021$area

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

pesticide_CMR_2021$all_pesticide_exposure <- pesticide_CMR_2021$mean_concentration_scale + pesticide_CMR_2021$mean_tii_scale + pesticide_CMR_2021$mean_concentration_scale_water

```

#### Value for 2022

```{r}

pesticide_CMR_2022 <- pesticide_air_CMR_average_year[which(pesticide_air_CMR_average_year$year==2022),]
pesticide_CMR_2022$mean_concentration_scale <- scales::rescale(pesticide_CMR_2022$mean_concentration, from=c(0,max_air))

pesticide_soil_CMR_average_2022 <- st_transform(pesticide_soil_CMR_average_year[which(pesticide_soil_CMR_average_year$year==2022),],st_crs(pesticide_CMR_2022))
pesticide_soil_CMR_average_2022$mean_tii_scale <- scales::rescale(pesticide_soil_CMR_average_2022$mean_tii, from = c(0,max_soil))
pesticide_water_CMR_average_2022 <- st_transform(pesticide_water_CMR_average_year[which(pesticide_water_CMR_average_year$year==2022),],st_crs(pesticide_CMR_2022))
pesticide_water_CMR_average_2022$mean_concentration_scale <- scales::rescale(pesticide_water_CMR_average_2022$mean_concentration, from = c(0,max_water))

pesticide_CMR_2022_df <- st_intersection(pesticide_CMR_2022,pesticide_soil_CMR_average_2022[,c("mean_tii","mean_tii_scale")])
pesticide_CMR_2022_df$area <- as.numeric(st_area(pesticide_CMR_2022_df))
pesticide_CMR_2022_df$mean_tii_area <- pesticide_CMR_2022_df$mean_tii*pesticide_CMR_2022_df$area
pesticide_CMR_2022_df$mean_tii_scale_area <- pesticide_CMR_2022_df$mean_tii_scale*pesticide_CMR_2022_df$area
pesticide_CMR_2022_df <- data.frame(data.frame(pesticide_CMR_2022_df) %>% group_by(id) %>% summarise(sum_tii_area = sum(mean_tii_area, na.rm=TRUE), sum_tii_scale_area = sum(mean_tii_scale_area, na.rm=TRUE)))
pesticide_CMR_2022$area <- as.numeric(st_area(pesticide_CMR_2022))
pesticide_CMR_2022$mean_tii <- pesticide_CMR_2022_df$sum_tii_area/pesticide_CMR_2022$area
pesticide_CMR_2022$mean_tii_scale <- pesticide_CMR_2022_df$sum_tii_scale_area/pesticide_CMR_2022$area

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

pesticide_CMR_2022$all_pesticide_exposure <- pesticide_CMR_2022$mean_concentration_scale + pesticide_CMR_2022$mean_tii_scale + pesticide_CMR_2022$mean_concentration_scale_water

```

#### Yearly exposure to active substance in use, air and water

```{r}

Yearly_exposure_to_active_substance_in_use_air_and_water <- rbind(pesticide_CMR_2013,pesticide_CMR_2014,pesticide_CMR_2015,pesticide_CMR_2016,
                                                                  pesticide_CMR_2017,pesticide_CMR_2018,pesticide_CMR_2019,pesticide_CMR_2020,
                                                                  pesticide_CMR_2021,pesticide_CMR_2022)

names(Yearly_exposure_to_active_substance_in_use_air_and_water)[c(3,4,6,7)] <- c("mean_concentration_air","mean_concentration_scale_air","mean_tii","mean_tii_scale")

```
