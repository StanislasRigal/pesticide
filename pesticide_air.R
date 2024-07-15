# Load data on pesticide in the air https://www.data.gouv.fr/fr/datasets/base-de-donnee-de-surveillance-de-pesticides-dans-l-air-par-les-aasqa-a-partir-de-2002/

pesticide_raw <- read.csv("raw_data/pesticides-2002-2022-v03-2024-vf.csv")

# load geographical data for French communes from https://public.opendatasoft.com/explore/dataset/georef-france-commune-arrondissement-municipal-millesime/export/?disjunctive.reg_name&disjunctive.dep_name&disjunctive.arrdep_name&disjunctive.ze2020_name&disjunctive.bv2012_name&disjunctive.epci_name&disjunctive.ept_name&disjunctive.com_name&disjunctive.com_arm_name&disjunctive.com_arm_is_mountain_area&sort=year&location=6,46.97276,3.93311&basemap=jawg.light

spdf_com <- sf::st_read("raw_data/georef-france-commune-arrondissement-municipal-millesime.geojson",  what = "sp")

spdf_com_metro <- spdf_com[which(spdf_com@data$reg_name %in% c("Nouvelle-Aquitaine","Centre-Val de Loire","Bourgogne-Franche-Comté","Hauts-de-France",
                                                   "Normandie","Grand Est","Bretagne","Occitanie","Île-de-France","Provence-Alpes-Côte d'Azur",
                                                   "Pays de la Loire","Auvergne-Rhône-Alpes","Corse")),]

# merge both datasets

names(pesticide_raw)[3] <- "com_code"

spdf_com_plot <- spdf_com_metro

spdf_com_plot@data$com_code <- unlist(spdf_com_plot@data$com_code)

spdf_com_plot@data <- join(spdf_com_plot@data, pesticide_raw, by="com_code")

spdf_com_plot_fort <- fortify(spdf_com_plot, region='com_code')
spdf_com_plot_fort$com_code <- spdf_com_metro_fort$id
sf.df <- join(spdf_com_plot_fort, spdf_com_plot@data, by="com_code")


sf.df <- st_as_sf(spdf_com_plot)


fr_boundary <- ne_states("france",returnclass = "sf")
fr_boundary <- fr_boundary[which(fr_boundary$type_en=="Metropolitan department"),]

fr_boundary %>% 
  group_by(admin) %>% 
  summarise() %>% 
  ggplot() +
  geom_sf() +
  theme(legend.position = 'none')

fr_boundary <- fr_boundary %>% 
  group_by(admin) %>% 
  summarise()

ggplot(sf.df) + coord_fixed(ratio = 1.3) +
  geom_sf(data=fr_boundary, fill='white') +
  geom_polygon(aes(x = long, y = lat, group = com_code, fill=count)) + 
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  theme_void() 

ggsave("output/map_air_pesticide.png",
       width = 32,
       height = 24,
       dpi = 400)
