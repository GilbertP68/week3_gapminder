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

###################################################################

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

# simpler way of having the same output as above

ggplot(data = gapminder,
       aes(x = year,
           y = lifeExp,
           group = country)) +
  geom_line(aes(colour = continent)) + 
  geom_point()

# The overlay of layers if the order is changed

ggplot(data = gapminder,
       aes(x = year,
           y = lifeExp,
           group = country)) +
  geom_point()+
  geom_line(aes(colour = continent))
 
###################################################################

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp))+
  geom_point(alpha = 0.3) +
  scale_x_log10()+
  geom_smooth(method = "lm", size =5, stroke = 2)

###################################################################

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp))+
  geom_point(aes(colour = continent)) +
  scale_x_log10()+
  scale_colour_manual(values = c("red", "green", "purple", "orange", "black" ))

##### Challenge 9 #####
# Modify the color and size of the points on the point layer 
# in the previous example.
# Hint: do not use the aes function.


ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent))+
  geom_point(size = 1)+ # you can add colour = "red"on the same line
  scale_x_log10()+
  scale_colour_manual(values = c("red", "green", "purple", "orange", "black" )) + 
  scale_size_identity(1)
 
##### Challenge 10 #####
# Modify your solution to Challenge 9 so that the points are
# now a different shape and are colored by continent with new trendlines.
# Hint: The color argument can be used inside the aesthetic.

  ggplot(data = gapminder,
         mapping = aes(x = gdpPercap,
                       y = lifeExp,
                       colour = continent, shape = continent))+
    geom_point()+
    scale_x_log10()+
    scale_colour_manual(values = c("red", "green", "purple", "orange", "black" )) + 
    scale_size_identity(1)+
    geom_smooth(method = "lm", size =1)
# The shadowing we see around the line is the standard error

##### Challenge 11 #####
# Try modifying the plot above by changing some colours in the scale to see 
# if you can find a pleasing combination. Run the colours() function if you 
# want to see a list of colour names R can use.

# There is also a scale_colour_brewer() scale that takes an argument palette 
# that is the name of a ColorBrewer palette. Select an appropriate colour palette
# for the continents from ColorBrewer and apply it to your plot instead.

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent))+
  geom_point(shape = "triangle")+
  scale_x_log10()+
  scale_color_manual(values = c(Europe = "red",
                                Africa = "green4",
                                Oceania = "blue",
                                Asia = "orange",
                                Americas = "black" )) + 
  scale_size_identity(1)+
  geom_smooth(method = "lm", size =1)

###################################################################

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent, shape = continent))+
  geom_point(size = 1.5)+
  scale_x_log10()+
  scale_colour_brewer(palette = "Set1") +
  scale_shape_manual(values = c(1,2, 7, 8, 10))
# If you want to include "scale_shape_manual" you need to assign 
# shape in the mapping section

##### Separate figures #####

a_countries <- filter(gapminder, str_starts(country, "A"))

ggplot(data = a_countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~ country)

a_countries <- gapminder %>% 
  filter(str_starts(country, "A"))
a_countries

ggplot(data = a_countries,
       mapping = aes(x = year,
                     y = lifeExp,
                     colour = continent,
                     group = country))+
  geom_line()+
  facet_wrap(~country) # this function separates each graph on separate panel

##########################################################################################
##### Challenge 12 #
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop,
                     label = country)) +
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)+
  geom_text()
 
################################################################################
 
ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop,
                     label = country)) +
  geom_point()+
  scale_x_log10()+
  facet_wrap(~continent)+
  geom_text()

###############################################################################

gapminder_rich <- filter(gapminder,year == 1977, gdpPercap > 30000)

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop,
                     label = country)) +
  geom_point()+
  scale_x_log10()+
  facet_wrap(~continent)+
  geom_text(data = gapminder_rich)

#################################################################################
##### One graph #####
gapminder_rich <- filter(gapminder,year == 1977, gdpPercap > 30000)

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop,
                     label = country)) +
  geom_point()+
  scale_x_log10()+
  geom_text(data = gapminder_rich)


a_countries <- filter(gapminder, str_starts(country, "A"))

ggplot(data = a_countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + 
  facet_wrap( ~ country)

a_countries <- gapminder %>% 
  filter(str_starts(country, "A"))
a_countries

################################################################################
##### Assign the ggplot to a variable #####

rough_plot <- ggplot(data = a_countries,
       mapping = aes(x = year,
                     y = lifeExp,
                     colour = continent,
                     group = country))+
  geom_line()+
  facet_wrap(~country) # this function separates each graph on separate panel

rough_plot + scale_color_brewer(palette = "Dark2")


rough_plot +
  labs(title = "Fig1",
       x = "Year",
       y = "Life expectancy",
       colour = "Continent")

rough_plot +
  labs(title = "Life expectancy for countries starting with A over time ",
      caption = "Data from gapminder",
       x = "Year",
       y = "Life expectancy",
       colour = "Continent") +
  theme(panel.grid.major = element_blank(),
  plot.title = element_text(size = 10),
  axis.line = element_line(colour = "blue", size =2)
        
  )

################################################################################
##### Saving our graphs #####

ggsave("figures/my_first_plot.jpg", 
       plot = rough_plot,
       width = 12,
       height = 10,
       units = "cm")


