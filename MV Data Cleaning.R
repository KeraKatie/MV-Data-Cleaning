library(tidyverse)
library(janitor)


# Import Data -------------------------------------------------------------

MV_onsite_data_text <- read_csv("data-raw/MV_Onsite_Data_Text.csv") %>%
clean_names()
  

sites_visited <- MV_onsite_data_text %>%
  filter(study_group == "Treatment (exit)") %>%
  select(survey_id, visited_gw_house_inside:visited_gristmill_or_distillery) %>%
    mutate(visited_gw_house_inside = replace_na(visited_gw_house_inside, "No")) %>%
  mutate(visited_gw_house_outside = replace_na(visited_gw_house_outside, "No")) %>%
  mutate(visited_slave_quarters = replace_na(visited_slave_quarters, "No")) %>%
  mutate(visited_outbuildings = replace_na(visited_outbuildings, "No")) %>%
      mutate(visited_farm = replace_na(visited_farm, "No")) %>%    
      mutate(visited_museum_ed_center = replace_na(visited_museum_ed_center, "No")) %>%
      mutate(saw_live_animals = replace_na(saw_live_animals, "No")) %>%
      mutate(visited_gardens_orchards = replace_na(visited_gardens_orchards, "No")) %>%
  mutate(visited_new_tomb = replace_na(visited_new_tomb, "No")) %>%
  mutate(visited_slave_memorial = replace_na(visited_slave_memorial, "No")) %>%
  mutate(visited_gristmill_or_distillery = replace_na(visited_gristmill_or_distillery, "No")) %>%
pivot_longer(cols = -survey_id,
               names_to = "locations_visited",
               values_to = "locations_visited_yes_no")


