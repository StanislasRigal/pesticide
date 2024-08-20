# donnees pesticides recuperees la : https://www.data.gouv.fr/fr/datasets/achats-de-pesticides-par-code-postal/
# donnees geographique des cantons ici : https://public.opendatasoft.com/explore/dataset/correspondance-code-insee-code-postal/export/

# load geographic data

code_postal <- sf::st_read("raw_data/correspondance-code-insee-code-postal.geojson")


# load pesticide sale data for one region to test

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

# format pesticide data for inclusion in geographic data

## type of data
ara[ara=="nc"] <- NA
ara$quantite_substance <- as.numeric(as.character(ara$quantite_substance))
ara$code_postal_acheteur <- as.factor(as.character(ara$code_postal_acheteur))
ara$code_postal_acheteur <- str_pad(ara$code_postal_acheteur, 5, pad = "0")

## average data by postal code
ara2 <- ara %>% group_by(code_postal_acheteur) %>% summarize(qte=mean(quantite_substance, na.rm=T))

## merge with geographical data
ara3 <- merge(code_postal,ara2,by.x=c("postal_code"), by.y=c("code_postal_acheteur"), all.x=TRUE)

## plot

ggplot(ara3)+
  geom_sf(aes(fill=qte)) +
  theme(axis.text=element_blank()) +
  coord_sf(xlim = c(-5,9),ylim=c(41,52))

# load data for all regions

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

## type of data
pesticide_substance_all_region[pesticide_substance_all_region=="nc"] <- NA
pesticide_substance_all_region$quantite_substance <- as.numeric(as.character(pesticide_substance_all_region$quantite_substance))
pesticide_substance_all_region$code_postal_acheteur <- as.factor(as.character(pesticide_substance_all_region$code_postal_acheteur))
pesticide_substance_all_region$code_postal_acheteur <- str_pad(pesticide_substance_all_region$code_postal_acheteur, 5, pad = "0")

pesticide_substance_all_region <- pesticide_substance_all_region[which(!is.na(pesticide_substance_all_region$substance)),]

#saveRDS(pesticide_substance_all_region,"output/pesticide_substance_all_region.rds")
pesticide_substance_all_region <- readRDS("output/pesticide_substance_all_region.rds")

## average data by postal code
pesticide_substance_qte <- pesticide_substance_all_region %>% group_by(code_postal_acheteur) %>% summarize(qte=mean(quantite_substance, na.rm=T))

## merge with geographical data
pesticide_substance_geo <- merge(code_postal,pesticide_substance_qte,by.x=c("postal_code"), by.y=c("code_postal_acheteur"), all.x=TRUE)

## plot
ggplot(pesticide_substance_geo)+
  geom_sf(aes(fill=qte), colour=NA) +
  theme(axis.text=element_blank()) +
  coord_sf(xlim = c(-5,9),ylim=c(41,52))


# get product use by commune

ara2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2013.csv", header=TRUE)
ara2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2014.csv", header=TRUE)
ara2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2015.csv", header=TRUE)
ara2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2016.csv", header=TRUE)
ara2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2017.csv", header=TRUE)
ara2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2018.csv", header=TRUE)
ara2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2019.csv", header=TRUE)
ara2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2020.csv", header=TRUE)
ara2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2021.csv", header=TRUE)
ara2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_AUVERGNE RHONE ALPES_2022.csv", header=TRUE)

bfc2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2013.csv", header=TRUE)
bfc2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2014.csv", header=TRUE)
bfc2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2015.csv", header=TRUE)
bfc2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2016.csv", header=TRUE)
bfc2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2017.csv", header=TRUE)
bfc2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2018.csv", header=TRUE)
bfc2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2019.csv", header=TRUE)
bfc2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2020.csv", header=TRUE)
bfc2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2021.csv", header=TRUE)
bfc2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BOURGOGNE FRANCHE COMTE_2022.csv", header=TRUE)

b2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2013.csv", header=TRUE)
b2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2014.csv", header=TRUE)
b2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2015.csv", header=TRUE)
b2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2016.csv", header=TRUE)
b2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2017.csv", header=TRUE)
b2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2018.csv", header=TRUE)
b2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2019.csv", header=TRUE)
b2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2020.csv", header=TRUE)
b2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2021.csv", header=TRUE)
b2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_BRETAGNE_2022.csv", header=TRUE)

cv2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2013.csv", header=TRUE)
cv2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2014.csv", header=TRUE)
cv2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2015.csv", header=TRUE)
cv2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2016.csv", header=TRUE)
cv2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2017.csv", header=TRUE)
cv2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2018.csv", header=TRUE)
cv2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2019.csv", header=TRUE)
cv2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2020.csv", header=TRUE)
cv2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2021.csv", header=TRUE)
cv2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CENTRE VAL DE LOIRE_2022.csv", header=TRUE)

c2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2013.csv", header=TRUE)
c2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2014.csv", header=TRUE)
c2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2015.csv", header=TRUE)
c2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2016.csv", header=TRUE)
c2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2017.csv", header=TRUE)
c2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2018.csv", header=TRUE)
c2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2019.csv", header=TRUE)
c2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2020.csv", header=TRUE)
c2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2021.csv", header=TRUE)
c2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_CORSE_2022.csv", header=TRUE)

ge2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2013.csv", header=TRUE)
ge2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2014.csv", header=TRUE)
ge2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2015.csv", header=TRUE)
ge2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2016.csv", header=TRUE)
ge2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2017.csv", header=TRUE)
ge2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2018.csv", header=TRUE)
ge2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2019.csv", header=TRUE)
ge2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2020.csv", header=TRUE)
ge2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2021.csv", header=TRUE)
ge2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_GRAND EST_2022.csv", header=TRUE)

hf2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2013.csv", header=TRUE)
hf2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2014.csv", header=TRUE)
hf2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2015.csv", header=TRUE)
hf2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2016.csv", header=TRUE)
hf2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2017.csv", header=TRUE)
hf2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2018.csv", header=TRUE)
hf2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2019.csv", header=TRUE)
hf2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2020.csv", header=TRUE)
hf2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2021.csv", header=TRUE)
hf2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_HAUTS DE FRANCE_2022.csv", header=TRUE)

if2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2013.csv", header=TRUE)
if2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2014.csv", header=TRUE)
if2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2015.csv", header=TRUE)
if2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2016.csv", header=TRUE)
if2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2017.csv", header=TRUE)
if2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2018.csv", header=TRUE)
if2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2019.csv", header=TRUE)
if2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2020.csv", header=TRUE)
if2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2021.csv", header=TRUE)
if2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_ILE DE FRANCE_2022.csv", header=TRUE)

n2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2013.csv", header=TRUE)
n2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2014.csv", header=TRUE)
n2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2015.csv", header=TRUE)
n2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2016.csv", header=TRUE)
n2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2017.csv", header=TRUE)
n2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2018.csv", header=TRUE)
n2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2019.csv", header=TRUE)
n2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2020.csv", header=TRUE)
n2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2021.csv", header=TRUE)
n2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NORMANDIE_2022.csv", header=TRUE)

na2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2013.csv", header=TRUE)
na2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2014.csv", header=TRUE)
na2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2015.csv", header=TRUE)
na2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2016.csv", header=TRUE)
na2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2017.csv", header=TRUE)
na2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2018.csv", header=TRUE)
na2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2019.csv", header=TRUE)
na2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2020.csv", header=TRUE)
na2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2021.csv", header=TRUE)
na2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_NOUVELLE AQUITAINE_2022.csv", header=TRUE)

o2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2013.csv", header=TRUE)
o2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2014.csv", header=TRUE)
o2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2015.csv", header=TRUE)
o2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2016.csv", header=TRUE)
o2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2017.csv", header=TRUE)
o2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2018.csv", header=TRUE)
o2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2019.csv", header=TRUE)
o2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2020.csv", header=TRUE)
o2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2021.csv", header=TRUE)
o2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_OCCITANIE_2022.csv", header=TRUE)

pl2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2013.csv", header=TRUE)
pl2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2014.csv", header=TRUE)
pl2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2015.csv", header=TRUE)
pl2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2016.csv", header=TRUE)
pl2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2017.csv", header=TRUE)
pl2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2018.csv", header=TRUE)
pl2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2019.csv", header=TRUE)
pl2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2020.csv", header=TRUE)
pl2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2021.csv", header=TRUE)
pl2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2022.csv", header=TRUE)

pa2013 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2013.csv", header=TRUE)
pa2014 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2014.csv", header=TRUE)
pa2015 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2015.csv", header=TRUE)
pa2016 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2016.csv", header=TRUE)
pa2017 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2017.csv", header=TRUE)
pa2018 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2018.csv", header=TRUE)
pa2019 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2019.csv", header=TRUE)
pa2020 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2020.csv", header=TRUE)
pa2021 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2021.csv", header=TRUE)
pa2022 <- read.csv2("raw_data/BNVD_TRACABILITE_20231023_ACHAT_CP_PRODUIT_PROVENCE ALPES COTE D AZUR_2022.csv", header=TRUE)

pesticide_produit_all_region <- rbind(ara2013,ara2014,ara2015,ara2016,ara2017,ara2018,ara2019,ara2020,ara2021,ara2022,
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

## type of data
pesticide_produit_all_region[pesticide_produit_all_region=="nc"] <- NA
pesticide_produit_all_region$quantite_produit <- as.numeric(as.character(pesticide_produit_all_region$quantite_produit))
pesticide_produit_all_region$code_postal_acheteur <- as.factor(as.character(pesticide_produit_all_region$code_postal_acheteur))
pesticide_produit_all_region$code_postal_acheteur <- str_pad(pesticide_produit_all_region$code_postal_acheteur, 5, pad = "0")

pesticide_produit_all_region <- pesticide_produit_all_region[which(!is.na(pesticide_produit_all_region$quantite_produit)),]

#saveRDS(pesticide_produit_all_region,"output/pesticide_produit_all_region.rds")
pesticide_produit_all_region <- readRDS("output/pesticide_produit_all_region.rds")


# compute NODU / indicateur d’intensité de traitement ITT = sum(QSA/DHSA)/SAU

## load utilized agricultural area https://www.observatoire-des-territoires.gouv.fr/surface-agricole-utilisee-sau

SAU <- read.csv2("raw_data/agri.csv",header=T)

code_postal_insee <- data.frame(code_postal[,c("insee_com","postal_code","nom_comm","superficie")])

code_postal_insee_SAU <- merge(code_postal_insee,SAU, by.x="insee_com", by.y="codgeo", all.x=TRUE)

code_postal_insee_SAU <- data.frame(code_postal_insee_SAU %>% group_by(postal_code) %>% summarize(superficie_tot=sum(superficie, na.rm=TRUE),
                                                                                                  sau_tot = sum(sau2020, na.rm = TRUE)))

saveRDS(code_postal_insee_SAU,"output/code_postal_insee_SAU.rds")
code_postal_insee_SAU <- readRDS("output/code_postal_insee_SAU.rds")

## get homologated usage doses per product https://www.data.gouv.fr/fr/datasets/donnees-ouvertes-du-catalogue-e-phy-des-produits-phytopharmaceutiques-matieres-fertilisantes-et-supports-de-culture-adjuvants-produits-mixtes-et-melanges/

usage <- read.csv2("raw_data/produits_usages_utf8.csv",header=T)
usage <- droplevels(subset(usage, dose.retenue.unite %in% c("g/ha", "kg/ha", "L/ha","mL/ha")))
usage$dose.retenue <- as.numeric(as.character(usage$dose.retenue))
usage$dose.retenue[usage$dose.retenue.unite=="g/ha"] <- usage$dose.retenue[usage$dose.retenue.unite=="g/ha"]/1000
usage$dose.retenue.unite[usage$dose.retenue.unite=="g/ha"] <- "kg/ha"
usage$dose.retenue[usage$dose.retenue.unite=="mL/ha"] <- usage$dose.retenue[usage$dose.retenue.unite=="mL/ha"]/1000
usage$dose.retenue.unite[usage$dose.retenue.unite=="mL/ha"] <- "L/ha"

usage_produit <- data.frame(usage %>% group_by(numero.AMM,dose.retenue.unite) %>% summarise(dose = min(dose.retenue))) # minimal dose per convention (Pingault et al. 2009)

## link with active substance

produit <- read.csv2("raw_data/produits_utf8.csv",header=T)

usage_produit_sa <- merge(usage_produit,produit[,c("numero.AMM","Substances.actives")], by="numero.AMM", all.x = TRUE)


## get homologated dose per active substance

usage_produit_sa_unique <- usage_produit_sa[grep("\\|", usage_produit_sa$Substances.actives, invert=TRUE),] # get product with only one substance as in Pingault

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

#saveRDS(usage_produit_sa_unique,"output/usage_produit_sa_unique.rds")
usage_produit_sa_unique <- readRDS("output/usage_produit_sa_unique.rds")

## get ITT per commune ITT = sum(QSA/DHSA)/SAU

### by postal code and SA
pesticide_pre_itt <- pesticide_substance_all_region[which(pesticide_substance_all_region$amm %in% unique(usage_produit_sa_unique$numero.AMM)),]
pesticide_pre_itt <- merge(pesticide_pre_itt,usage_produit_sa_unique,by.x=c("amm"), by.y=c("numero.AMM"), all.x=TRUE)
pesticide_pre_itt$qsa_dhsa <- pesticide_pre_itt$quantite_substance/pesticide_pre_itt$dose_homo_sa
#saveRDS(pesticide_pre_itt,"output/pesticide_pre_itt.rds")
pesticide_pre_itt <- readRDS("output/pesticide_pre_itt.rds")

pesticide_pre_itt_sau <- merge(pesticide_pre_itt,code_postal_insee_SAU,by.x="code_postal_acheteur",by.y="postal_code",all.x = TRUE)
pesticide_pre_itt_sau$itt <- pesticide_pre_itt_sau$qsa_dhsa/pesticide_pre_itt_sau$sau_tot
#saveRDS(pesticide_pre_itt_sau,"output/pesticide_pre_itt_sau.rds")
pesticide_pre_itt_sau <- readRDS("output/pesticide_pre_itt_sau.rds")

### by postal code
pesticide_itt <- data.frame(pesticide_pre_itt %>% group_by(code_postal_acheteur) %>% summarise(sum_qsa_dhsa = sum(qsa_dhsa, na.rm=T)))
pesticide_itt_sau <- merge(code_postal_insee_SAU,pesticide_itt,by.x="postal_code",by.y="code_postal_acheteur",all.x = TRUE)
pesticide_itt_sau$itt <- pesticide_itt_sau$sum_qsa_dhsa/pesticide_itt_sau$sau2020

pesticide_itt_sau_plot <-  merge(code_postal,pesticide_itt,by.x="postal_code",by.y="code_postal_acheteur",all.x = TRUE)
pesticide_itt_sau_plot <- merge(pesticide_itt_sau_plot,SAU, by.x="insee_com", by.y="codgeo", all.x=TRUE)
pesticide_itt_sau_plot$itt <- pesticide_itt_sau_plot$sum_qsa_dhsa/pesticide_itt_sau_plot$sau2020

ggplot(pesticide_itt_sau_plot)+
  geom_sf(aes(fill=log(itt+1)), colour=NA) +
  theme(axis.text=element_blank()) +
  coord_sf(xlim = c(-5,9),ylim=c(41,52))


# compute IFT = sum(QP/DHP)/SAU

pesticide_produit_all_region_l <- pesticide_produit_all_region[which(pesticide_produit_all_region$conditionnement=="l"),]
pesticide_produit_all_region_kg <- pesticide_produit_all_region[which(pesticide_produit_all_region$conditionnement=="kg"),]

pesticide_pre_ift <- pesticide_produit_all_region[which(pesticide_produit_all_region$amm %in% unique(usage_produit$numero.AMM)),]

pesticide_pre_ift <- merge(pesticide_pre_ift,usage_produit,by.x=c("amm"), by.y=c("numero.AMM"), all.x=TRUE)

pesticide_pre_ift$unit_produit_dose <- paste0(pesticide_pre_ift$conditionnement,sep="_",pesticide_pre_ift$dose.retenue.unite)
pesticide_pre_ift <- pesticide_pre_ift[which(pesticide_pre_ift$unit_produit_dose %in% c("kg_kg/ha","l_L/ha")),]
pesticide_pre_ift$qp_dhp <- pesticide_pre_ift$quantite_produit/pesticide_pre_ift$dose

pesticide_ift <- data.frame(pesticide_pre_ift %>% group_by(code_postal_acheteur) %>% summarise(sum_qp_dhp = sum(qp_dhp, na.rm=T)))
pesticide_ift_sau <- merge(code_postal_insee_SAU,pesticide_ift,by.x="postal_code",by.y="code_postal_acheteur",all.x = TRUE)
pesticide_ift_sau$ift <- pesticide_ift_sau$sum_qp_dhp/pesticide_ift_sau$sau2020

pesticide_ift_sau_plot <-  merge(code_postal,pesticide_ift,by.x="postal_code",by.y="code_postal_acheteur",all.x = TRUE)
pesticide_ift_sau_plot <- merge(pesticide_ift_sau_plot,SAU, by.x="insee_com", by.y="codgeo", all.x=TRUE)
pesticide_ift_sau_plot$ift <- pesticide_ift_sau_plot$sum_qp_dhp/pesticide_ift_sau_plot$sau2020

ggplot(pesticide_ift_sau_plot)+
  geom_sf(aes(fill=log(ift+1)), colour=NA) +
  theme(axis.text=element_blank()) +
  coord_sf(xlim = c(-5,9),ylim=c(41,52))





# par an, avec classification=="T, T+, CMR"

pesticide_itt_year <- data.frame(pesticide_pre_itt %>% group_by(code_postal_acheteur,annee,substance) %>% summarise(sum_qsa_dhsa = sum(qsa_dhsa, na.rm=T), sum_qsa = sum(quantite_substance, na.rm=T)))
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


#saveRDS(qsa_pesticide_year,"output/qsa_pesticide_year.rds")
qsa_pesticide_year <- readRDS("output/qsa_pesticide_year.rds")
#saveRDS(itt_pesticide_year,"output/itt_pesticide_year.rds")
itt_pesticide_year <- readRDS("output/itt_pesticide_year.rds")























# on regarde par an pour calculer une pente :

pesticide7 <- ddply(pest3,.(code_postal_acheteur, annee), sum_pest2, .parallel = F, .progress = "text")
names(pesticide7)[3] <- c("qte")
pesticide7$CP_annee <- as.factor(paste0(pesticide7$code_postal_acheteur,sep="_",pesticide7$annee))
pesticide7b <- ddply(droplevels(pest3[pest3$classification=="T, T+, CMR",]),.(code_postal_acheteur, annee), sum_pest2, .parallel = F, .progress = "text")
names(pesticide7b)[3] <- c("qte_tox")
pesticide7b$CP_annee <- as.factor(paste0(pesticide7b$code_postal_acheteur,sep="_",pesticide7b$annee))

pest_pente <- merge(pesticide7,SAU2, by.x=c("code_postal_acheteur"), by.y=c("code_postal"),all=T)
pest_pente <- merge(pest_pente,pesticide7b[-c(1:2)], by.x=c("CP_annee"), by.y=c("CP_annee"), all=T)

pest_pente$qte_tox[which(is.na(pest_pente$qte_tox) & !is.na(pest_pente$qte))] <- 0

pest_pente$traitement_SAU <- pest_pente$qte/pest_pente$SAU
pest_pente$traitement_tox_SAU <- pest_pente$qte_tox/pest_pente$SAU

carre_sp_point <- SpatialPoints(carre_centroid2[,2:3])
proj4string(carre_sp_point) <-  CRS("+proj=longlat +ellps=WGS84")
a2_test <- a2
proj4string(a2_test) <- CRS("+proj=longlat +ellps=WGS84")
carre_pesticide <- data.frame(carre_centroid2,cp=over(carre_sp_point, a2_test))
lien_cp_cc <- data.frame(cp=1:36613,com_un=levels(as.factor(a$Commune_unique)))
carre_pesticide <- merge(carre_pesticide,lien_cp_cc, by="cp", all.x=T)
a_test <-  data.frame(a %>% group_by(Commune_unique,Code.Postal) %>% summarize(count=n()))
carre_pesticide2 <- merge(carre_pesticide,a_test[,c("Commune_unique","Code.Postal")], by.x="com_un",by.y="Commune_unique", all.x=T)
carre_pesticide3 <- merge(carre_pesticide2,pest_pente[,c("code_postal_acheteur","annee","qte","Ex_agri","Travail","SAU","Cheptel",
                                                       "Super_labour","Super_culture","Super_herbe","qte_tox","traitement_SAU","traitement_tox_SAU")],
                        by.x="Code.Postal",by.y="code_postal_acheteur", all.x=T)


pente_cal <- function(x){
  qte_moy=mean(x$qte, na.rm=T)
  if(length(which(!is.na(x$traitement_SAU)))>1){
    pente1 <- summary(lm(traitement_SAU~annee, x))$coefficients
  }else{pente1 <- matrix(NA,nrow=2,ncol=4)}
  if(length(which(!is.na(x$qte_tox)))>0){
    qte_tox_moy=mean(x$qte_tox, na.rm=T)
  }else{qte_tox_moy=NA}
  if(length(which(!is.na(x$traitement_tox_SAU)))>1){
    pente2 <- summary(lm(traitement_tox_SAU~annee, x))$coefficients
  }else{pente2 <- matrix(NA,nrow=2,ncol=4)}
  return(data.frame(qte_moy, pente=pente1[2,1],pval1=pente1[2,4],
                    qte_tox_moy,pente_tox=pente2[2,1],pval2=pente2[2,4]))
}
pente_cal2 <- function(x){tryCatch(pente_cal(x),
                                error=function(e) data.frame(qte_moy=NA,pente=NA,pval1=NA,qte_tox_moy=NA,pente_tox=NA,pval2=NA))}
pest_pente2 <- ddply(pest_pente,.(code_postal_acheteur), pente_cal2, .parallel = F, .progress = "text")

pest_pente2 <- merge(pest_pente2,SAU2, by.x=c("code_postal_acheteur"), by.y=c("code_postal"),all=T)
pest_pente2$traitement_SAU <- pest_pente2$qte_moy/pest_pente2$SAU
pest_pente2$traitement_tox_SAU <- pest_pente2$qte_tox_moy/pest_pente2$SAU

pest_pente2$pente_s <- pest_pente2$pente
pest_pente2$pente_s[pest_pente2$pval1>0.05] <- 0
pest_pente2$pente_tox_s <- pest_pente2$pente_tox
pest_pente2$pente_tox_s[pest_pente2$pval2>0.05] <- 0

pesticide8 <- merge(pesticide3,droplevels(pest_pente2),by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
row.names(pesticide8) <- pesticide8$id

a6 <- SpatialPolygonsDataFrame(a4,data = pesticide8)
map <- a6
map.data  <-  data.frame(id=rownames(map@data), map@data)
map.df    <-  fortify(map)
map.df    <-  merge(map.df,map.data,by="id")

ggplot(map.df, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=log(traitement_SAU+0.01)))+
  scale_fill_viridis(alpha = 1, begin = 0, end = 1, direction = 1, option = "B") +
  theme(axis.text=element_blank())+
  theme_minimal()+
  coord_fixed(1.3)

ggplot(map.df, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=log(traitement_tox_SAU+0.001)))+
  scale_fill_viridis(alpha = 1, begin = 0, end = 1, direction = 1, option = "B") +
  theme(axis.text=element_blank())+
  theme_minimal()+
  coord_fixed(1.3)

ggplot(map.df[map.df$pente_tox_s>0,], aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=log(pente_tox_s+0.001)))+
  scale_fill_viridis(alpha = 1, begin = 0, end = 1, direction = 1, option = "B") +
  theme(axis.text=element_blank())+
  theme_minimal()+
  coord_fixed(1.3)

carre_sp_point <- SpatialPoints(carre_centroid2[,2:3])
proj4string(carre_sp_point) <-  CRS("+proj=longlat +ellps=WGS84")
pest5b <- over(carre_sp_point, a6)
pest5b$long <- carre_centroid2$long
pest5b$lat <- carre_centroid2$lat
pest5b$code_carre <- carre_centroid2$code_carre
pest5b$log1 <- log(pest5b$traitement_SAU+0.001)
pest5b$log2 <- log(pest5b$traitement_tox_SAU+0.001)

