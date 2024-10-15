library(tidyverse)

gapminder_data <- read_csv("gapminder_data.csv")

summary(gapminder_data)

gapminder_data %>%
  summarize(averageLifeExp = mean(lifeExp))

gapminder_data_summarized <- gapminder_data %>%
  summarize(averageLifeExp=mean(lifeExp))

gapminder_data_summarized

gapminder_data

gapminder_data %>%  
  summarize(recent_year = max(year))

gapminder_data %>%
  filter(year == 2007) %>%
  summarize(average=mean(lifeExp))

gapminder_data %>%
  summarize(first_year=min(year))

gapminder_data %>%
  filter(year == 1952) %>%
  summarize(average_gdp=mean(gdpPercap))

gapminder_data %>%
  group_by(year) %>%
  summarize(average=mean(lifeExp))

gapminder_data %>%
  group_by(continent) %>%
  summarize(average=mean(lifeExp))

# all the continents min, max and average life exp. for all of the years and 
# 1952(oldest) 2007 (most recent)

life_exp_by_continent <- gapminder_data %>%
  group_by(continent) %>%
  summarize(min=min(lifeExp), average=mean(lifeExp), max=max(lifeExp))

life_exp_by_continent_1952 <- gapminder_data %>%
  group_by(continent) %>%
  filter(year == 1952) %>%
  summarize(min=min(lifeExp), average=mean(lifeExp), max=max(lifeExp))

life_exp_by_continent_2007 <- gapminder_data %>%
  group_by(continent) %>%
  filter(year == 2007) %>%
  summarize(min=min(lifeExp), average=mean(lifeExp), max=max(lifeExp))

# finding the gdp

total_gdp_by_country <- gapminder_data %>%
  mutate(gdp = pop * gdpPercap)

population_in_millions <- gapminder_data %>%
  mutate(popInMillions = pop / 1000000)

gapminder_data %>%
  select(- pop, - gdpPercap)

# ------------------------------------------

gapminder_data_2007_Americas <- read_csv("gapminder_data.csv") %>%
  filter(year == 2007 & continent == "Americas") %>%
  select(- year, - continent)


