1 + 100
1 == 2
log(1)

x <- 1/40
log(x)
x + x
x <- 100
x

y <- c(1, 4.5, 2.7, 9)
y
z <- 1:5
z

# Create a vector of animals
animals <- c("monkey", "rabbit", "dog")
animals

# Add 4 to each element of y
y + 4
y <- y + 4 # save y as the original y + 4
y

paste("The animal is: ", animals)

# Inspect the type of an object
typeof(y)
typeof(z)
typeof(animals)

# Predict what happens when I do this:
new_vec <- c(5, 7.5, "hat")
typeof(new_vec)
new_vec

y2 <- c(1, 5, 7)
2y <- c(6, 4, 2)
_y <- 1:8

Y2

# What is the value of each variable after each statement in the following:
mass <- 47.5
mass
age
age <- 122
mass
age
mass <- mass * 2.3
mass
age
age <- age - 20
age

mass > age

# Remove a variable
rm(y2)
y2

# Loading data
cats <- read.csv(file = "data/feline-data.csv")
cats

class(cats)

# Extract a column
cats$weight

cats$weight + 2

# Show the structure of an object
str(cats)

# Read in data without treating strings as factors
cats2 <- read.csv(file = "data/feline-data.csv", stringsAsFactors = FALSE)
str(cats2)

# Read in gapminder
gapminder <- read.csv(file = "data/gapminder.csv", stringsAsFactors = FALSE)

str(gapminder)
gapminder

nrow(gapminder)
ncol(gapminder)
dim(gapminder)
colnames(gapminder)

# View first few rows
head(gapminder, n = 10)
tail(gapminder)

# Summarize data
summary(gapminder)

# Subsetting
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
x
names(x) <- c("a", "b", "c", "d", "e")
x

# Indexing
x[1]
x[4]
x[c(1, 3)]
x[1:4]
x[c(1, 1, 3)]
x[6]

# Excluding
x[-2]
x[c(-1, -5)]

# Subsetting by name
x[c("a", "c")]

# Three ways to get b, c, and d
x[c(-1, -5)]
x[2:4]
x[c("b", "c", "d")]
x[c(2, 3, 4)]

# Logical subsetting
x > 6
x
x[x > 6]
x[x < 7]

length(x)
x_new <- x[x > 6]
length(x_new)

# Data frame subsetting
gapminder$year

gapminder[1:3,]
gapminder[3,]
gapminder[1:3, 1:3]

gapminder[, c("lifeExp", "pop")]

gapminder$year < 1960
gapminder[gapminder$year < 1960, c("year", "pop")]

# Challenge exercise
#Extract observations collected for the year 1957
gapminder[gapminder$year == 1957,]

#Extract all columns except 1 through to 4
gapminder[,c(-1:-4)]
gapminder[,-1:-4]
gapminder[, -c(1:4)]
-1:4

#Extract the rows where the life expectancy is longer the 80 years
gapminder[gapminder$lifeExp > 80, ]

# Extract the first row, and the fourth and fifth columns (lifeExp and gdpPercap).
gapminder[1, 4:5]
gapminder[1, c(4, 5)]

# Advanced: extract rows that contain information for the years 2002 and 2007
gapminder[gapminder$year == 2002 | 2007,]
gapminder[gapminder$year == 2002 | gapminder$year == 2007, ]
gapminder[gapminder$year %in% c(2002, 2007), ]

# Plotting

# Installing the package (only needs to be done once)
install.packages("ggplot2")

# Load the package (needs to be done in each new R session when you want to use it)
library("ggplot2")

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Life exp over time, points colored by continent
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_point()

# Life exp over time, lines instead of points
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent, by = country)) +
  geom_line() +
  geom_point()


ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) +
  geom_point() +
  geom_line(aes(color = continent))


# Back to life exp vs gdp
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  scale_x_log10()

# Fit a smoothing line
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 4) +
  scale_x_log10() +
  geom_smooth(method = "lm")

# Look up help for a function
?geom_smooth

# Facetting
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ continent)

# Facet grid
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() +
  facet_grid(year ~ continent)

# Subsetting data before plotting
asia <- gapminder[gapminder$continent == "Asia", ]
ggplot(data = gapminder[gapminder$continent == "Asia", ], aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Modifying text
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  xlab("GDP per capita") +
  ylab("Life expectancy") +
  ggtitle("Figure 1") +
  theme_void() +
  ggsave("my_awesome_plot.png", width = 6, height = 4)








