# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

# Using the base plotting system, I made a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

# First I read in the data #
NEI <- readRDS("summarySCC_PM25.rds")

# Then I summed the PM25 emissions by year #
plot1.dat <- NEI %>%
        group_by(year) %>%
        summarize(PM25 = sum(Emissions))

# Finally, I turned off the scientific notation option and created the plot #
getOption("scipen")
opt <- options("scipen" = 20)
getOption("scipen")

barplot(height = plot1.dat$PM25,        
        names.arg = plot1.dat$year,
        col="red",
        main = "PM25 Emissions (1999 - 2008)",
        ylab = "PM25 emissions from all sources (tons)",
        xlab = "Year")

options(opt)
