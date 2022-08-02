# Jeu de données de départ
adm3_pop_2009 %>% 
  # Création d'une nouvelle variable
  mutate(total = homme + femme) %>% 
  # Spécification du niveau d'agrégation
  group_by(admin1_nom) %>% 
  # Opération d'agrégation 
  summarize(
    # Population totale par région
    population = sum(total),
    # Nombre de communes par région
    nombre_communes = n()
    ) %>% 
  # Tri: décroissant
  arrange(desc(population))