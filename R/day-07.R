###### Mika Leslie - 09/12/20
##### Excercise 7

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)

region = data.frame(state_abbr = state.abb, region = state.region, state = state.name)

inner_join(covid, region, by = "state") ->
  region_covid

region_covid %>%
  group_by(region, date) %>%
  summarize(totCases = sum(cases), totDeaths = sum(deaths)) %>%
  pivot_longer(cols = c('totCases', 'totDeaths')) %>%
  ggplot(aes(x=date, y = value))+
  geom_line(aes(col = region))+
  facet_grid(name~region, scales = "free_y")+
  labs(title = "Cummulative Cases and Deaths: Region",
       subtitle = "Data Source: NY-Times",
       x = "Date",
       y = "Daily Cumulative Count",
       caption = "Daily Exercise 07")+
  theme_dark()+
  theme(legend.position = "none") +
  ggsave(file = "img/Ex07-plot.png")





