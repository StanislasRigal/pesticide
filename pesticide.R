# donnees pesticides recuperees la : https://www.data.gouv.fr/fr/datasets/achats-de-pesticides-par-code-postal/
# donnees geographique des cantons ici : https://public.opendatasoft.com/explore/dataset/correspondance-code-insee-code-postal/export/

library(tidyr)
code_postal <- read.csv2("correspondance-code-insee-code-postal.csv", header=TRUE)
code_postal <- separate(code_postal,"geo_point_2d",c("lat","lon"),sep = ",")

clean <- function(x){
  x_cleaned <- gsub('{"type": "Polygon", "coordinates": [[','',x, fixed = TRUE)
  x_cleaned <- gsub('{\"type\": \"MultiPolygon\", \"coordinates\": [[','',x_cleaned, fixed = TRUE)
  x_cleaned <- gsub(']]}','',x_cleaned, fixed = TRUE)
  return(x_cleaned)
} 

code_postal$geo_shape<-sapply(code_postal$geo_shape,clean)
code_postal<-separate(code_postal,"geo_shape",into=paste(rep("C",486), sep = "_", c(1:486)),sep = "],")
code_postal2<-melt(code_postal, id.vars = names(code_postal)[c(1:11,498:503)])
code_postal2<-na.omit(code_postal2)
code_postal2$variable<-NULL
code_postal2$poly<-sapply(code_postal2$value,FUN=function(x){gsub('[','',x, fixed = TRUE)})
code_postal2$poly<-sapply(code_postal2$poly,FUN=function(x){gsub(']','',x, fixed = TRUE)})
code_postal2$value<-NULL
code_postal2<-separate(code_postal2,"poly",c("lon_poly","lat_poly"),sep = ", ")
code_postal2$lat<-as.numeric(code_postal2$lat)
code_postal2$lon<-as.numeric(code_postal2$lon)
code_postal2$lat_poly<-as.numeric(code_postal2$lat_poly)
code_postal2$lon_poly<-as.numeric(code_postal2$lon_poly)
#commune_multi<-code_postal2$Code.Commune[which(is.na(code_postal2$lon_poly))]
#code_postal2<-code_postal2[!(code_postal2$Code.Commune %in% commune_multi),]
code_postal2$Altitude.Moyenne<-as.numeric(as.character(code_postal2$Altitude.Moyenne))
code_postal2$Superficie<-as.numeric(as.character(code_postal2$Superficie))
code_postal2$Population<-as.numeric(as.character(code_postal2$Population))

a<-droplevels(code_postal2[code_postal2$lat>40,])
a$Commune_unique<-paste0(a$Commune, sep="_", a$Code.Postal, sep="_", a$Code.Commune)
a2<-lapply(split(a[,c(18:19)], a$Commune_unique), Polygon)
a2<-SpatialPolygons(lapply(seq_along(a2),function(i){Polygons(list(a2[[i]]),ID=row.names(a[!duplicated(a$Commune_unique),])[i])}))
aa<-a %>% group_by(Code.Postal, Commune, Code.Commune) %>% summarize(count=n()) %>% data.frame()
aa$Commune_unique<-as.factor(paste0(aa$Commune, sep="_", aa$Code.Postal, sep="_", aa$Code.Commune))
aa$dep<-a$Code.Département[match(aa$Commune_unique,a$Commune_unique)]
aa2<-aa[order(aa$Commune_unique),]
a5<-gBuffer(a2, byid=TRUE, width=0)
a4<-unionSpatialPolygons(a5,aa2[,1])
proj4string(a4)<-CRS("+proj=longlat +ellps=WGS84")

test<-data.frame(value=c(rep(1,round(length(a4)/2)),rep(2,length(a4)-round(length(a4)/2))))
row.names(test)<-names(a4)
a6<-SpatialPolygonsDataFrame(a4,data = test)


ara2013<-read.csv2("bnvd-2018-achat-cp-substance-auvergne-rhone-alpes-2013.csv", header=TRUE)
ara2014<-read.csv2("bnvd-2018-achat-cp-substance-auvergne-rhone-alpes-2014.csv", header=TRUE)
ara2015<-read.csv2("bnvd-2018-achat-cp-substance-auvergne-rhone-alpes-2015.csv", header=TRUE)
ara2016<-read.csv2("bnvd-2018-achat-cp-substance-auvergne-rhone-alpes-2016.csv", header=TRUE)
ara2017<-read.csv2("bnvd-2018-achat-cp-substance-auvergne-rhone-alpes-2017.csv", header=TRUE)
ara<-rbind(ara2013,ara2014,ara2015,ara2016,ara2017)
ara[ara=="nc"]<-"NA"
ara$quantite_substance<-as.numeric(as.character(ara$quantite_substance))
ara$code_postal_acheteur<-as.factor(as.character(ara$code_postal_acheteur))
ara$code_postal_acheteur<-str_pad(ara$code_postal_acheteur, 5, pad = "0")
ara2<-ara %>% group_by(code_postal_acheteur) %>% summarize(qte=mean(quantite_substance, na.rm=T))
ara3<-data.frame(id=names(a4))
ara4<-merge(ara3,ara2,by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
row.names(ara4)<-ara4$id

a6<-SpatialPolygonsDataFrame(a4,data = ara4)
map<-a6
map.data <- data.frame(id=rownames(map@data), map@data)
map.df   <- fortify(map)
map.df   <- merge(map.df,map.data,by="id")
ggplot(map.df, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=qte))+
  geom_path(colour="grey")+
  theme(axis.text=element_blank())+
  coord_fixed()

b2013<-read.csv2("bnvd-2018-achat-cp-substance-bretagne-2013.csv", header=TRUE)
b2014<-read.csv2("bnvd-2018-achat-cp-substance-bretagne-2014.csv", header=TRUE)
b2015<-read.csv2("bnvd-2018-achat-cp-substance-bretagne-2015.csv", header=TRUE)
b2016<-read.csv2("bnvd-2018-achat-cp-substance-bretagne-2016.csv", header=TRUE)
b2017<-read.csv2("bnvd-2018-achat-cp-substance-bretagne-2017.csv", header=TRUE)

bfc2013<-read.csv2("bnvd-2018-achat-cp-substance-bourgogne-franche-comte-2013.csv", header=TRUE)
bfc2014<-read.csv2("bnvd-2018-achat-cp-substance-bourgogne-franche-comte-2014.csv", header=TRUE)
bfc2015<-read.csv2("bnvd-2018-achat-cp-substance-bourgogne-franche-comte-2015.csv", header=TRUE)
bfc2016<-read.csv2("bnvd-2018-achat-cp-substance-bourgogne-franche-comte-2016.csv", header=TRUE)
bfc2017<-read.csv2("bnvd-2018-achat-cp-substance-bourgogne-franche-comte-2017.csv", header=TRUE)

cv2013<-read.csv2("bnvd-2018-achat-cp-substance-centre-val de loire-2013.csv", header=TRUE)
cv2014<-read.csv2("bnvd-2018-achat-cp-substance-centre-val de loire-2014.csv", header=TRUE)
cv2015<-read.csv2("bnvd-2018-achat-cp-substance-centre-val de loire-2015.csv", header=TRUE)
cv2016<-read.csv2("bnvd-2018-achat-cp-substance-centre-val de loire-2016.csv", header=TRUE)
cv2017<-read.csv2("bnvd-2018-achat-cp-substance-centre-val de loire-2017.csv", header=TRUE)

c2013<-read.csv2("bnvd-2018-achat-cp-substance-corse-2013.csv", header=TRUE)
c2014<-read.csv2("bnvd-2018-achat-cp-substance-corse-2014.csv", header=TRUE)
c2015<-read.csv2("bnvd-2018-achat-cp-substance-corse-2015.csv", header=TRUE)
c2016<-read.csv2("bnvd-2018-achat-cp-substance-corse-2016.csv", header=TRUE)
c2017<-read.csv2("bnvd-2018-achat-cp-substance-corse-2017.csv", header=TRUE)

ge2013<-read.csv2("bnvd-2018-achat-cp-substance-grand est-2013.csv", header=TRUE)
ge2014<-read.csv2("bnvd-2018-achat-cp-substance-grand est-2014.csv", header=TRUE)
ge2015<-read.csv2("bnvd-2018-achat-cp-substance-grand est-2015.csv", header=TRUE)
ge2016<-read.csv2("bnvd-2018-achat-cp-substance-grand est-2016.csv", header=TRUE)
ge2017<-read.csv2("bnvd-2018-achat-cp-substance-grand est-2017.csv", header=TRUE)

hf2013<-read.csv2("bnvd-2018-achat-cp-substance-hauts-de-france-2013.csv", header=TRUE)
hf2014<-read.csv2("bnvd-2018-achat-cp-substance-hauts-de-france-2014.csv", header=TRUE)
hf2015<-read.csv2("bnvd-2018-achat-cp-substance-hauts-de-france-2015.csv", header=TRUE)
hf2016<-read.csv2("bnvd-2018-achat-cp-substance-hauts-de-france-2016.csv", header=TRUE)
hf2017<-read.csv2("bnvd-2018-achat-cp-substance-hauts-de-france-2017.csv", header=TRUE)

if2013<-read.csv2("bnvd-2018-achat-cp-substance-ile-de-france-2013.csv", header=TRUE)
if2014<-read.csv2("bnvd-2018-achat-cp-substance-ile-de-france-2014.csv", header=TRUE)
if2015<-read.csv2("bnvd-2018-achat-cp-substance-ile-de-france-2015.csv", header=TRUE)
if2016<-read.csv2("bnvd-2018-achat-cp-substance-ile-de-france-2016.csv", header=TRUE)
if2017<-read.csv2("bnvd-2018-achat-cp-substance-ile-de-france-2017.csv", header=TRUE)

n2013<-read.csv2("bnvd-2018-achat-cp-substance-normandie-2013.csv", header=TRUE)
n2014<-read.csv2("bnvd-2018-achat-cp-substance-normandie-2014.csv", header=TRUE)
n2015<-read.csv2("bnvd-2018-achat-cp-substance-normandie-2015.csv", header=TRUE)
n2016<-read.csv2("bnvd-2018-achat-cp-substance-normandie-2016.csv", header=TRUE)
n2017<-read.csv2("bnvd-2018-achat-cp-substance-normandie-2017.csv", header=TRUE)

na2013<-read.csv2("bnvd-2018-achat-cp-substance-nouvelle-aquitaine-2013.csv", header=TRUE)
na2014<-read.csv2("bnvd-2018-achat-cp-substance-nouvelle-aquitaine-2014.csv", header=TRUE)
na2015<-read.csv2("bnvd-2018-achat-cp-substance-nouvelle-aquitaine-2015.csv", header=TRUE)
na2016<-read.csv2("bnvd-2018-achat-cp-substance-nouvelle-aquitaine-2016.csv", header=TRUE)
na2017<-read.csv2("bnvd-2018-achat-cp-substance-nouvelle-aquitaine-2017.csv", header=TRUE)

o2013<-read.csv2("bnvd-2018-achat-cp-substance-occitanie-2013.csv", header=TRUE)
o2014<-read.csv2("bnvd-2018-achat-cp-substance-occitanie-2014.csv", header=TRUE)
o2015<-read.csv2("bnvd-2018-achat-cp-substance-occitanie-2015.csv", header=TRUE)
o2016<-read.csv2("bnvd-2018-achat-cp-substance-occitanie-2016.csv", header=TRUE)
o2017<-read.csv2("bnvd-2018-achat-cp-substance-occitanie-2017.csv", header=TRUE)

pl2013<-read.csv2("bnvd-2018-achat-cp-substance-pays de la loire-2013.csv", header=TRUE)
pl2014<-read.csv2("bnvd-2018-achat-cp-substance-pays de la loire-2014.csv", header=TRUE)
pl2015<-read.csv2("bnvd-2018-achat-cp-substance-pays de la loire-2015.csv", header=TRUE)
pl2016<-read.csv2("bnvd-2018-achat-cp-substance-pays de la loire-2016.csv", header=TRUE)
pl2017<-read.csv2("bnvd-2018-achat-cp-substance-pays de la loire-2017.csv", header=TRUE)

pa2013<-read.csv2("bnvd-2018-achat-cp-substance-provence-alpes-cote d''azur-2013.csv", header=TRUE)
pa2014<-read.csv2("bnvd-2018-achat-cp-substance-provence-alpes-cote d''azur-2014.csv", header=TRUE)
pa2015<-read.csv2("bnvd-2018-achat-cp-substance-provence-alpes-cote d''azur-2015.csv", header=TRUE)
pa2016<-read.csv2("bnvd-2018-achat-cp-substance-provence-alpes-cote d''azur-2016.csv", header=TRUE)
pa2017<-read.csv2("bnvd-2018-achat-cp-substance-provence-alpes-cote d''azur-2017.csv", header=TRUE)

pesticide<-rbind(ara2013,ara2014,ara2015,ara2016,ara2017,
                 b2013,b2014,b2015,b2016,b2017,
                 bfc2013,bfc2014,bfc2015,bfc2016,bfc2017,
                 cv2013,cv2014,cv2015,cv2016,cv2017,
                 c2013,c2014,c2015,c2016,c2017,
                 ge2013,ge2014,ge2015,ge2016,ge2017,
                 hf2013,hf2014,hf2015,hf2016,hf2017,
                 if2013,if2014,if2015,if2016,if2017,
                 n2013,n2014,n2015,n2016,n2017,
                 na2013,na2014,na2015,na2016,na2017,
                 o2013,o2014,o2015,o2016,o2017,
                 pl2013,pl2014,pl2015,pl2016,pl2017,
                 pa2013,pa2014,pa2015,pa2016,pa2017)

pesticide[pesticide=="nc"]<-"NA"
pesticide$quantite_substance<-as.numeric(as.character(pesticide$quantite_substance))
pesticide$code_postal_acheteur<-as.factor(as.character(pesticide$code_postal_acheteur))
pesticide$code_postal_acheteur<-str_pad(pesticide$code_postal_acheteur, 5, pad = "0")
pesticide2<-pesticide %>% group_by(code_postal_acheteur) %>% summarize(qte=mean(quantite_substance, na.rm=T))

pest<-droplevels(na.omit(pesticide))
sum_pest<-function(x){
  qte<-length(levels(droplevels(x$substance)))
  qte2<-sum(x$quantite_substance, na.rm=T)
  return(c(qte,qte2))
}
pesticide2b<-ddply(droplevels(pest[pest$classification=="T, T+, CMR",]),.(code_postal_acheteur), sum_pest, .parallel = F, .progress = "text")
names(pesticide2b)[2:3]<-c("qte","qte2")
pesticide2c<-ddply(pest,.(code_postal_acheteur), sum_pest, .parallel = F, .progress = "text")
names(pesticide2c)[2:3]<-c("qte","qte2")

pesticide3<-data.frame(id=names(a4))
pesticide4<-merge(pesticide3,pesticide2,by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
pesticide4<-merge(pesticide3,pesticide2b,by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
pesticide4<-merge(pesticide3,pesticide2c,by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
row.names(pesticide4)<-pesticide4$id

a6<-SpatialPolygonsDataFrame(a4,data = pesticide4)
map<-a6
map.data <- data.frame(id=rownames(map@data), map@data)
map.df   <- fortify(map)
map.df   <- merge(map.df,map.data,by="id")
ggplot(map.df, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=qte))+
  #geom_path(colour="grey")+
  theme(axis.text=element_blank())+
  coord_fixed(1.3)

SAU<-read.csv("SAU.csv",header=T)
SAU$code_postal<-code_postal2$Code.Postal[match(SAU$Code_geo,code_postal2$Code.INSEE)]
SAU2<-SAU %>% group_by(code_postal) %>% summarize(Ex_agri=sum(Ex_agri, na.rm = T),Travail=sum(Travail, na.rm = T),
                                                  SAU=sum(SAU, na.rm = T),Cheptel=sum(Cheptel, na.rm = T),
                                                  Super_labour=sum(Super_labour, na.rm = T),
                                                  Super_culture=sum(Super_culture, na.rm = T),
                                                  Super_herbe=sum(Super_herbe, na.rm = T))
pest2<-merge(pesticide2c,SAU2, by.x=c("code_postal_acheteur"), by.y=c("code_postal"),all=T)
pest2<-merge(pest2,pesticide2b, by.x=c("code_postal_acheteur"), by.y=c("code_postal_acheteur"), all=T)

pest2$traitement_SAU<-pest2$qte.x/pest2$SAU
pest2$qte_traitement_SAU<-pest2$qte2.x/pest2$SAU
pest2$traitement_sp_SAU<-pest2$qte.y/pest2$SAU
pest2$qte_traitement_sp_SAU<-pest2$qte2.y/pest2$SAU

pest2$traitement_SAU<-pest2$qte2.y/(pest2$Super_culture+pest2$Super_labour)
pest2$traitement_SAU2<-pest2$traitement_SAU
pest2$traitement_SAU2[pest2$traitement_SAU2>10]<-10
pest2$traitement_SAU3<-pest2$traitement_SAU2
pest2$traitement_SAU3[pest2$traitement_SAU3<10 & pest2$traitement_SAU3>=5]<-5
pest2$traitement_SAU3[pest2$traitement_SAU3<5 & pest2$traitement_SAU3>=2]<-2
pest2$traitement_SAU3[pest2$traitement_SAU3<2 & pest2$traitement_SAU3>=1]<-1
pest2$traitement_SAU3[pest2$traitement_SAU3<1 & pest2$traitement_SAU3>=0.1]<-0.1
pest2$traitement_SAU3[pest2$traitement_SAU3<0.1]<-0.01
pest2$traitement_SAU3<-as.factor(as.character(pest2$traitement_SAU3))


pesticide3<-data.frame(id=names(a4))
pesticide5<-merge(pesticide3,pest2,by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
row.names(pesticide5)<-pesticide5$id

a6<-SpatialPolygonsDataFrame(a4,data = pesticide5)
map<-a6
map.data <- data.frame(id=rownames(map@data), map@data)
map.df   <- fortify(map)
map.df   <- merge(map.df,map.data,by="id")
ggplot(map.df, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=traitement_SAU))+
  theme(axis.text=element_blank())+
  coord_fixed(1.3)

usage<-read.csv2("usage_pesticide.csv",header=T)
usage2<-droplevels(subset(usage, unite %in% c("g/ha", "kg/ha")))
usage2$dose<-as.numeric(as.character(usage2$dose))
usage2$dose[usage2$unite=="g/ha"]<-usage2$dose[usage2$unite=="g/ha"]/1000
usage2$unite[usage2$unite=="g/ha"]<-"kg/ha"

pest$dose<-usage2$dose[match(pest$amm,usage2$amm)]
pest3<-na.omit(pest)
pest3$nodu<-pest3$quantite_substance/pest3$dose

sum_pest2<-function(x){
  qte<-sum(x$nodu, na.rm=T)
  return(c(qte))
}
pesticide6<-ddply(pest3,.(code_postal_acheteur), sum_pest2, .parallel = F, .progress = "text")
names(pesticide6)[2]<-c("qte")
pesticide6b<-ddply(droplevels(pest3[pest3$classification=="T, T+, CMR",]),.(code_postal_acheteur), sum_pest2, .parallel = F, .progress = "text")
names(pesticide6b)[2]<-c("qte")

pest4<-merge(pesticide6,SAU2, by.x=c("code_postal_acheteur"), by.y=c("code_postal"),all=T)
pest4<-merge(pest4,pesticide6b, by.x=c("code_postal_acheteur"), by.y=c("code_postal_acheteur"), all=T)

pest4$traitement_SAU<-pest4$qte.x/pest4$SAU
pest4$traitement_sp_SAU<-pest4$qte.y/pest4$SAU
pest4$traitement_SC<-pest4$qte.x/(pest4$Super_culture+pest4$Super_labour)
pest4$traitement_sp_SC<-pest4$qte.y/(pest4$Super_culture+pest4$Super_labour)

pest4$traitement_SAU2<-pest4$traitement_SAU
pest4$traitement_SAU2[pest4$traitement_SAU2>10]<-10
pest4$traitement_SAU3<-pest4$traitement_SAU2
pest4$traitement_SAU3[pest4$traitement_SAU3<10 & pest4$traitement_SAU3>=5]<-5
pest4$traitement_SAU3[pest4$traitement_SAU3<5 & pest4$traitement_SAU3>=2]<-2
pest4$traitement_SAU3[pest4$traitement_SAU3<2 & pest4$traitement_SAU3>=1]<-1
pest4$traitement_SAU3[pest4$traitement_SAU3<1 & pest4$traitement_SAU3>=0.1]<-0.1
pest4$traitement_SAU3[pest4$traitement_SAU3<0.1]<-0.01
pest4$traitement_SAU3<-as.factor(as.character(pest4$traitement_SAU3))
pest4$log_tr<-log(pest4$traitement_SAU+0.01)

pesticide3<-data.frame(id=names(a4))
pesticide5<-merge(pesticide3,droplevels(pest4[pest4$traitement_SAU<800,]),by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
row.names(pesticide5)<-pesticide5$id

a6<-SpatialPolygonsDataFrame(a4,data = pesticide5)
map<-a6
map.data <- data.frame(id=rownames(map@data), map@data)
map.df   <- fortify(map)
map.df   <- merge(map.df,map.data,by="id")
ggplot(map.df, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=traitement_SAU3))+
  scale_fill_manual(values =  c("0.01" = "darkgreen", "0.1" = "green", "1" = "yellow", "2" = "orange", "5"="darkorange","10"="red","NaN"="grey"),na.value="grey")+
  theme(axis.text=element_blank())+
  theme_minimal()+
  coord_fixed(1.3)

ggplot(map.df, aes(x=long, y=lat, group=group))+
  geom_polygon(aes(fill=log(traitement_SAU+0.01)))+
  scale_fill_viridis(alpha = 1, begin = 0, end = 1, direction = 1, option = "B") +
  theme(axis.text=element_blank())+
  theme_minimal()+
  coord_fixed(1.3)

carre_sp_point<-SpatialPoints(carre_centroid2[,2:3])
proj4string(carre_sp_point)<- CRS("+proj=longlat +ellps=WGS84")
pest5<-over(carre_sp_point, a6)
pest5$long<-carre_centroid2$long
pest5$lat<-carre_centroid2$lat
pest5$code_carre<-carre_centroid2$code_carre
pest5$log<-log(pest5$traitement_SAU+0.01)

ggplot(pest5, aes(x=long, y=lat))+
  geom_point(aes(col=log(traitement_SAU+0.01)))+
  scale_color_viridis(alpha = 1, begin = 0, end = 1, direction = 1, option = "B") +
  theme(axis.text=element_blank())+
  theme_minimal()+
  coord_fixed(1.3)


# onregarde par an pour calculer une pente :

pesticide7<-ddply(pest3,.(code_postal_acheteur, annee), sum_pest2, .parallel = F, .progress = "text")
names(pesticide7)[3]<-c("qte")
pesticide7$CP_annee<-as.factor(paste0(pesticide7$code_postal_acheteur,sep="_",pesticide7$annee))
pesticide7b<-ddply(droplevels(pest3[pest3$classification=="T, T+, CMR",]),.(code_postal_acheteur, annee), sum_pest2, .parallel = F, .progress = "text")
names(pesticide7b)[3]<-c("qte_tox")
pesticide7b$CP_annee<-as.factor(paste0(pesticide7b$code_postal_acheteur,sep="_",pesticide7b$annee))

pest_pente<-merge(pesticide7,SAU2, by.x=c("code_postal_acheteur"), by.y=c("code_postal"),all=T)
pest_pente<-merge(pest_pente,pesticide7b[-c(1:2)], by.x=c("CP_annee"), by.y=c("CP_annee"), all=T)

pest_pente$qte_tox[which(is.na(pest_pente$qte_tox) & !is.na(pest_pente$qte))]<-0

pest_pente$traitement_SAU<-pest_pente$qte/pest_pente$SAU
pest_pente$traitement_tox_SAU<-pest_pente$qte_tox/pest_pente$SAU

carre_sp_point<-SpatialPoints(carre_centroid2[,2:3])
proj4string(carre_sp_point)<- CRS("+proj=longlat +ellps=WGS84")
a2_test<-a2
proj4string(a2_test)<-CRS("+proj=longlat +ellps=WGS84")
carre_pesticide<-data.frame(carre_centroid2,cp=over(carre_sp_point, a2_test))
lien_cp_cc<-data.frame(cp=1:36613,com_un=levels(as.factor(a$Commune_unique)))
carre_pesticide<-merge(carre_pesticide,lien_cp_cc, by="cp", all.x=T)
a_test<- data.frame(a %>% group_by(Commune_unique,Code.Postal) %>% summarize(count=n()))
carre_pesticide2<-merge(carre_pesticide,a_test[,c("Commune_unique","Code.Postal")], by.x="com_un",by.y="Commune_unique", all.x=T)
carre_pesticide3<-merge(carre_pesticide2,pest_pente[,c("code_postal_acheteur","annee","qte","Ex_agri","Travail","SAU","Cheptel",
                                                       "Super_labour","Super_culture","Super_herbe","qte_tox","traitement_SAU","traitement_tox_SAU")],
                        by.x="Code.Postal",by.y="code_postal_acheteur", all.x=T)


pente_cal<-function(x){
  qte_moy=mean(x$qte, na.rm=T)
  if(length(which(!is.na(x$traitement_SAU)))>1){
    pente1<-summary(lm(traitement_SAU~annee, x))$coefficients
  }else{pente1<-matrix(NA,nrow=2,ncol=4)}
  if(length(which(!is.na(x$qte_tox)))>0){
    qte_tox_moy=mean(x$qte_tox, na.rm=T)
  }else{qte_tox_moy=NA}
  if(length(which(!is.na(x$traitement_tox_SAU)))>1){
    pente2<-summary(lm(traitement_tox_SAU~annee, x))$coefficients
  }else{pente2<-matrix(NA,nrow=2,ncol=4)}
  return(data.frame(qte_moy, pente=pente1[2,1],pval1=pente1[2,4],
                    qte_tox_moy,pente_tox=pente2[2,1],pval2=pente2[2,4]))
}
pente_cal2<-function(x){tryCatch(pente_cal(x),
                                error=function(e) data.frame(qte_moy=NA,pente=NA,pval1=NA,qte_tox_moy=NA,pente_tox=NA,pval2=NA))}
pest_pente2<-ddply(pest_pente,.(code_postal_acheteur), pente_cal2, .parallel = F, .progress = "text")

pest_pente2<-merge(pest_pente2,SAU2, by.x=c("code_postal_acheteur"), by.y=c("code_postal"),all=T)
pest_pente2$traitement_SAU<-pest_pente2$qte_moy/pest_pente2$SAU
pest_pente2$traitement_tox_SAU<-pest_pente2$qte_tox_moy/pest_pente2$SAU

pest_pente2$pente_s<-pest_pente2$pente
pest_pente2$pente_s[pest_pente2$pval1>0.05]<-0
pest_pente2$pente_tox_s<-pest_pente2$pente_tox
pest_pente2$pente_tox_s[pest_pente2$pval2>0.05]<-0

pesticide8<-merge(pesticide3,droplevels(pest_pente2),by.x=c("id"), by.y=c("code_postal_acheteur"), all.x=TRUE)
row.names(pesticide8)<-pesticide8$id

a6<-SpatialPolygonsDataFrame(a4,data = pesticide8)
map<-a6
map.data <- data.frame(id=rownames(map@data), map@data)
map.df   <- fortify(map)
map.df   <- merge(map.df,map.data,by="id")

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

carre_sp_point<-SpatialPoints(carre_centroid2[,2:3])
proj4string(carre_sp_point)<- CRS("+proj=longlat +ellps=WGS84")
pest5b<-over(carre_sp_point, a6)
pest5b$long<-carre_centroid2$long
pest5b$lat<-carre_centroid2$lat
pest5b$code_carre<-carre_centroid2$code_carre
pest5b$log1<-log(pest5b$traitement_SAU+0.001)
pest5b$log2<-log(pest5b$traitement_tox_SAU+0.001)

