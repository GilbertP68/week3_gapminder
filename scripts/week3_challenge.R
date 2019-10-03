library(tidyverse)

gapminder <- read_csv("Data/gapminder.csv")
gapminder # It's good to have a look at the data; For example: "glimpse", str()

gapminder_1977 <- gapminder %>% 
  filter(year == 1977)

ggplot(data = gapminder_1977)

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop))

# The geometrics are added to the graph
ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point()

# The graph will be scaled
# Example 6.1
ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point() +
  scale_x_log10()

##### Challenge 4 #####
# Example 6.2:
ggplot(data = gapminder_1977,
       mapping = aes(x = pop,
                     y = lifeExp,
                     colour = continent,
                     size = gdpPercap)) +
  geom_point() +
  scale_x_log10()

# Example 6.3: Not enough space to display the graph
ggplot(data = gapminder_1977,
       mapping = aes(x = pop,
                     y = lifeExp,
                     colour = country,
                     size = gdpPercap)) +
  geom_point() +
  scale_x_log10()

# Example 6.4: Life exp vs continent
ggplot(data = gapminder_1977,
       mapping = aes(x = continent,
                     y = lifeExp,
                     colour = continent,
                     size = gdpPercap)) +
  geom_point()

# Another way of building graph

ggplot(data = gapminder_1977) +
  geom_point(mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           colour = continent,
                           size = pop)) +
  scale_x_log10()


# Example 6.5:
ggplot(data = gapminder_1977,
       mapping = aes(x = pop,
                     y = lifeExp)) +
  geom_point(colour = 4,
             size = 5) +
  scale_x_log10()

# Example 6.6:
ggplot(data = gapminder_1977,
       mapping = aes(x = pop,
                     y = lifeExp)) +
  geom_point(colour = 4,
             size = 5,
             stroke = 3) +
  scale_x_log10()

# Example 6.7:
ggplot(data = gapminder_1977,
       mapping = aes(x = pop,
                     y = lifeExp)) +
  geom_point(alpha = 0.2,
            colour = 11,
             size = 5,
             stroke = 3,
              shape = "square") +
  scale_x_log10()

ggplot(data = gapminder_1977,
       mapping = aes(x = pop,
                     y = lifeExp)) +
  geom_point(aes(alpha = 0.2),
             colour = 11,
             size = 5,
             stroke = 3,
             shape = "square") +
  scale_x_log10()

##### Challenge 7 #####
# Example 7.1
gapminder <- read_csv("Data/gapminder.csv")
gapminder # It's good to have a look at the data; For example: "glimpse", str()

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     colour = continent,
                     size = gdpPercap)) +
  geom_point()

# Example 7.2
gapminder <- read_csv("Data/gapminder.csv")
gapminder

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     group = country,
                     colour = continent)) +
  geom_line()

##### Challenge 8 #####
# Modify the code from the example above so that only the lines 
# are coloured by continent and the points remain black.
# Then switch the order of the geom_line() and geom_point() layers.
# What do you notice?
  
ggplot(data = gapminder,
       aes(x = year,
           y = lifeExp,
           group = country,
           colour = continent)) +
  geom_line() + 
  geom_point(colour = "black")


