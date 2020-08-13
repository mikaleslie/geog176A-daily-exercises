###### Mika Leslie - 08/12/20
##### Excercise 6

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'

covid %>%
  filter(date == max(date)) %>%
  arrange(-cases) %>%
  select(county, state, cases) %>%
  head(6)%>%
  pull(state) %>%

top6 = filter(covid, state == "New York" | state == "California" | state == "Florida" | state == "Arizona" | state == "Illinois" | state == "Texas")


ggplot(data = top6, aes(x = date, y = cases)) +
  geom_smooth(aes(color = state)) +
  labs(title = "Cumulative Case Counts: COVID-19 Pandemic",
       x = "Date",
       y = "Cases",
       caption = "Daily Exercise 06",
       color = "")+
  facet_wrap(~state)+
  theme_dark()+
  ggsave(file = "img/Ex06-Q1-plot.png")

covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  ggplot(aes(x = date, y = cases))+
  geom_col(color = "red")+
  labs(title = "National Cumulative Case Counts: COVID-19 Pandemic",
         x = "Date",
         y = "Cases",
         caption = "Daily Exercise 06")+
  theme_dark()+
  ggsave(file = "img/Ex06-Q2-plot.png")










