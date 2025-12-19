dados_filtrados <- MBDAF_ed7_M4_Atividade_Individual %>%
  filter(trimws(code) %in% c("30. Messi", "7. Sterling", "8. Paredes", "16. Rodri"))
#print(head(dados_filtrados))

if (!require(png)) install.packages("png", dependencies = TRUE)

library(ggplot2)
library(dplyr)
library(png)

#-------------------------LEANDRO PAREDES--------------------------

paredes_dados <- dados_filtrados %>% filter(code == "8. Paredes")

acoes_defensivas <- c("Interceptions", "Tackles (Successful actions)", 
                      "Tackles (Unsuccessful actions)", "Challenges (won)", 
                      "Challenges (lost)")

paredes_dados_defensivos <- paredes_dados %>%
  filter(Action %in% acoes_defensivas)

paredes_dados_defensivos$pos_x <- as.numeric(paredes_dados_defensivos$pos_x)
paredes_dados_defensivos$pos_y <- as.numeric(paredes_dados_defensivos$pos_y)

ggplot() +
  geom_point(data = paredes_dados_defensivos, aes(x = pos_x, y = pos_y), color = "blue", size = 2) 
  labs(title = "Ações Defensivas de Leandro Paredes", x = "Posição X", y = "Posição Y") 
  theme_void() 
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68)) 

#-------------------------RODRI--------------------------

rodri_dados <- dados_filtrados %>% filter(code == "16. Rodri")

rodri_dados$pos_x <- as.numeric(rodri_dados$pos_x)
rodri_dados$pos_y <- as.numeric(rodri_dados$pos_y)

mapa_percurso <- ggplot() +
  geom_point(data = rodri_dados, aes(x = pos_x, y = pos_y), color = "red", size = 1) 
  labs(title = "Mapa de Percurso de Rodri", x = "Posição X", y = "Posição Y") 
  theme_void()  
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68))

print(mapa_percurso)

mapa_calor <- ggplot() +
  geom_density_2d(data = rodri_dados, aes(x = pos_x, y = pos_y), color = "red") 
  labs(title = "Mapa de Calor de Rodri", x = "Posição X", y = "Posição Y") 
  theme_void()  
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68))

print(mapa_calor)

#-------------------------MESSI E STERLING--------------------------

messi_sterling_dados <- dados_filtrados %>% 
  filter(code %in% c("30. Messi", "7. Sterling"))

messi_sterling_dados$pos_x <- as.numeric(messi_sterling_dados$pos_x)
messi_sterling_dados$pos_y <- as.numeric(messi_sterling_dados$pos_y)

dribles_acao <- c("Dribbles (Successful actions)", "Dribbles (Unsuccessful actions)")

dribles_dados <- messi_sterling_dados %>%
  filter(Action %in% dribles_acao)

ggplot() +
  geom_point(data = dribles_dados, aes(x = pos_x, y = pos_y, color = code, shape = Action), size = 2) 
  scale_color_manual(values = c("30. Messi" = "blue", "7. Sterling" = "orange")) 
  scale_shape_manual(values = c("Dribbles (Successful actions)" = 16, "Dribbles (Unsuccessful actions)" = 17)) 
  labs(title = "Dribles de Messi e Sterling", x = "Posição X", y = "Posição Y") 
  theme_void()  
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68))  

#-------------------------POSICIONAMENTO MÉDIO PSG--------------------------

dados <- MBDAF_ed7_M4_Atividade_Individual  

dados_psg <- dados %>%
     filter(Team == "PSG")

posicionamento_medio_psg <- dados_psg %>%
    group_by(code, Team) %>% 
     summarise(pos_x = mean(as.numeric(pos_x), na.rm = TRUE),
               pos_y = mean(as.numeric(pos_y), na.rm = TRUE),
               .groups = "drop")

convex_hulls_psg <- posicionamento_medio_psg %>%
    group_by(Team) %>%
    filter(n() > 2) %>%  
    slice(chull(pos_x, pos_y))
 
 ggplot() 
     geom_polygon(data = convex_hulls_psg, aes(x = pos_x, y = pos_y, group = Team, fill = Team), alpha = 0.2)   
     geom_point(data = posicionamento_medio_psg, aes(x = pos_x, y = pos_y, color = Team), size = 3)  
     geom_text(data = posicionamento_medio_psg, aes(x = pos_x, y = pos_y, label = code), vjust = -1, size = 3)   
     scale_fill_manual(values = c("blue"))   
     scale_color_manual(values = c("blue")) 
     labs(title = "Posicionamento Médio dos Titulares do PSG", x = "Posição X", y = "Posição Y") 
     theme_void() +  
     coord_cartesian(xlim = c(0, 100), ylim = c(0, 68)) 

#-------------------------POSICIONAMENTO MÉDIO MAN CITY--------------------------

dados_city <- dados %>%
  filter(Team == "Manchester City")

posicionamento_medio_city <- dados_city %>%
  group_by(code, Team) %>%  
  summarise(pos_x = mean(as.numeric(pos_x), na.rm = TRUE),
            pos_y = mean(as.numeric(pos_y), na.rm = TRUE),
            .groups = "drop")

convex_hulls_city <- posicionamento_medio_city %>%
  group_by(Team) %>%
  filter(n() > 2) %>%  
  slice(chull(pos_x, pos_y))

ggplot() 
  geom_polygon(data = convex_hulls_city, aes(x = pos_x, y = pos_y, group = Team, fill = Team), alpha = 0.2) 
  geom_point(data = posicionamento_medio_city, aes(x = pos_x, y = pos_y, color = Team), size = 3) 
  geom_text(data = posicionamento_medio_city, aes(x = pos_x, y = pos_y, label = code), vjust = -1, size = 3) 
  scale_fill_manual(values = c("blue")) 
  scale_color_manual(values = c("blue"))   
  labs(title = "Posicionamento Médio dos Titulares do Manchester City", x = "Posição X", y = "Posição Y") 
  theme_void() 
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68))  

#-------------------------PASSES PSG--------------------------

passes_psg <- dados %>%
  filter(Action %in% c("Passes accurate", "Passes (inaccurate)"),
         Team == "PSG")  

unique(passes_psg$Action)  

passes_psg$pos_x <- as.numeric(passes_psg$pos_x)
passes_psg$pos_y <- as.numeric(passes_psg$pos_y)

passes_psg <- passes_psg %>%
  mutate(pass_type = case_when(
    Action == "Passes accurate" ~ "Certo",
    Action == "Passes (inaccurate)" ~ "Errado",
    TRUE ~ NA_character_  
  ))

passes_psg <- passes_psg %>% filter(!is.na(pass_type))

ggplot() 
  geom_point(data = passes_psg, aes(x = pos_x, y = pos_y, color = pass_type), size = 2) 
  scale_color_manual(values = c("Certo" = "blue", "Errado" = "orange")) 
  labs(title = "Mapa de Passes do PSG", x = "Posição X", y = "Posição Y", color = "Tipo de Passe") 
  theme_void() 
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68)) 

#-------------------------PASSES MAN CITY--------------------------

passes_city <- dados %>%
  filter(Action %in% c("Passes accurate", "Passes (inaccurate)"),
         Team == "Manchester City")  

unique(passes_city$Action)  

passes_city$pos_x <- as.numeric(passes_city$pos_x)
passes_city$pos_y <- as.numeric(passes_city$pos_y)

passes_city <- passes_city %>%
  mutate(pass_type = case_when(
    Action == "Passes accurate" ~ "Certo",
    Action == "Passes (inaccurate)" ~ "Errado",
    TRUE ~ NA_character_  
  ))

passes_city <- passes_city %>% filter(!is.na(pass_type))

ggplot() 
  geom_point(data = passes_city, aes(x = pos_x, y = pos_y, color = pass_type), size = 2) 
  scale_color_manual(values = c("Certo" = "blue", "Errado" = "orange")) 
  labs(title = "Mapa de Passes do Manchester City", x = "Posição X", y = "Posição Y", color = "Tipo de Passe") 
  theme_void() 
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68))  

#-------------------------XG PSG--------------------------

remates_psg <- dados %>%
  filter(Team == "PSG" & 
         Action %in% c("Shots", "Shot on target", "Shot on target (saved)", 
                       "Wide shot", "Shots blocked", "Goals"))

remates_psg$pos_x <- as.numeric(remates_psg$pos_x)
remates_psg$pos_y <- as.numeric(remates_psg$pos_y)

remates_psg$xG <- as.numeric(remates_psg$xG)

xG_psg_total <- sum(remates_psg$xG, na.rm = TRUE)

ggplot() 
  geom_point(data = remates_psg, aes(x = pos_x, y = pos_y), color = "blue", size = 3) 
  geom_text(aes(x = 5, y = 60, label = paste("PSG: xG =", round(xG_psg_total, 2))),
            color = "black", size = 5, fontface = "bold") 
  labs(title = "Mapa de xG do PSG", x = "Posição X", y = "Posição Y") 
  theme_void()
  theme(plot.background = element_rect(fill = "white", color = "white")) 

#-------------------------XG MAN CITY--------------------------

remates_city <- dados %>%
  filter(Team == "Manchester City" & 
         Action %in% c("Shots", "Shot on target", "Shot on target (saved)", 
                       "Wide shot", "Shots blocked", "Goals"))

remates_city$pos_x <- as.numeric(remates_city$pos_x)
remates_city$pos_y <- as.numeric(remates_city$pos_y)

remates_city$xG <- as.numeric(remates_city$xG)

xG_city_total <- sum(remates_city$xG, na.rm = TRUE)

ggplot() 
  geom_point(data = remates_city, aes(x = pos_x, y = pos_y), color = "red", size = 3) 
  geom_text(aes(x = 5, y = 60, label = paste("Man City: xG =", round(xG_city_total, 2))),
            color = "black", size = 5, fontface = "bold") 
  labs(title = "Mapa de xG do Manchester City", x = "Posição X", y = "Posição Y") 
  theme_void() 
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 68))  

