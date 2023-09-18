# R scraping line by line walkthrough
library(xml2)
library(rvest)
library(tidyverse)
library(rjson)
library(dplyr)
library(tidyverse)
library(purrr)
library(dplyr)
library(tidyverse)
library(gridExtra)                              
library(reshape2) 
library(RColorBrewer)
library(viridis)
library(glmnet)
library(ggplot2)


setwd("/Users/student/desktop/classes_this_semester/stat_495")

getwd()

#season stats, needs to be slimmed down into a more targeted df
season_stats_df <- read.csv("understat.com.csv")

#variable descriptions
#npxG - expected goals without penalties and own goals
#xGA_diff - difference between expected goals against and missed
#npxGA - expected goals against without penalties and own goals
#npxGD - difference between for and against expected goals without penalties and own goals
#ppda_coef - passes per defensive action in opposing half
#oppda_coef - opponent passes allowed per defenseive action in opposition half
#deep - passes completed within 20 yards of goal, crosses excluded
#xpts - expected points


#champions league data df
CL_url_20 = "https://fbref.com/en/comps/8/2900/2019-2020-Champions-League-Stats"
CL_html_20 = rvest::read_html(CL_url_20)

season_19_20<- CL_url_20 %>%
  rvest::read_html(CL_url_20) %>%
  html_nodes(xpath = '//*[@id="div_results29000_overall"]') %>%
  rvest::html_table()

#next table 19-19
CL_url_19 = "https://fbref.com/en/comps/8/2102/2018-2019-Champions-League-Stats"
CL_html_19 = rvest::read_html(CL_url_19)

season_18_19 <- CL_url_19 %>%
  rvest::read_html(CL_url_19) %>%
  html_nodes(xpath = '//*[@id="results21020_overall"]') %>%
  rvest::html_table()

#17-18
CL_url_18 = "https://fbref.com/en/comps/8/1656/2017-2018-Champions-League-Stats"
CL_html_18 = rvest::read_html(CL_url_18)

season_17_18 <- CL_url_18 %>%
  rvest::read_html(CL_url_18) %>%
  html_nodes(xpath = '//*[@id="results16560_overall"]') %>%
  rvest::html_table()

#16-17
CL_url_17 = "https://fbref.com/en/comps/8/1551/2016-2017-Champions-League-Stats"
CL_html_17 = rvest::read_html(CL_url_17)

season_16_17 <- CL_url_17 %>%
  rvest::read_html(CL_url_17) %>%
  html_nodes(xpath = '//*[@id="results15510_overall"]') %>%
  rvest::html_table()

#15-16
CL_url_16 = "https://fbref.com/en/comps/8/1555/2015-2016-Champions-League-Stats"
CL_html_16 = rvest::read_html(CL_url_16)

season_15_16 <- CL_url_16 %>%
  rvest::read_html(CL_url_16) %>%
  html_nodes(xpath = '//*[@id="results15550_overall"]') %>%
  rvest::html_table()

#14-15
CL_url_15 = "https://fbref.com/en/comps/8/768/2014-2015-Champions-League-Stats"
CL_html_15 = rvest::read_html(CL_url_15)

season_14_15 <- CL_url_15 %>%
  rvest::read_html(CL_url_15) %>%
  html_nodes(xpath = '//*[@id="results7680_overall"]') %>%
  rvest::html_table()

#13-14
CL_url_14 = "https://fbref.com/en/comps/8/694/2013-2014-Champions-League-Stats"
CL_html_14 = rvest::read_html(CL_url_14)

season_13_14 <- CL_url_14 %>%
  rvest::read_html(CL_url_14) %>%
  html_nodes(xpath = '//*[@id="results6940_overall"]') %>%
  rvest::html_table()



#convert lists to df
#making list into df 19-20 season
CL_DF_19_20 <- do.call(rbind.data.frame, season_19_20)

#making list into df 18-19 season
CL_DF_18_19 <- do.call(rbind.data.frame, season_18_19)

#17-18
CL_DF_17_18 <- do.call(rbind.data.frame, season_17_18)

#16-17
CL_DF_16_17 <- do.call(rbind.data.frame, season_16_17)

#15-16
CL_DF_15_16 <- do.call(rbind.data.frame, season_15_16)

#14-15
CL_DF_14_15 <- do.call(rbind.data.frame, season_14_15)

#13-14
CL_DF_13_14 <- do.call(rbind.data.frame, season_13_14)


#remove NA and completing dataframes
#19-20 season
CL_19_20_fin <- (CL_DF_19_20[!is.na(CL_DF_19_20$MP),])
#18-19
CL_18_19_fin <- (CL_DF_18_19[!is.na(CL_DF_18_19$MP),])
#17-18
CL_17_18_fin <- (CL_DF_17_18[!is.na(CL_DF_17_18$MP),])
#16-17
CL_16_17_fin <- (CL_DF_16_17[!is.na(CL_DF_16_17$MP),])
#15-16
CL_15_16_fin <- (CL_DF_15_16[!is.na(CL_DF_15_16$MP),])
#14-15
CL_14_15_fin <- (CL_DF_14_15[!is.na(CL_DF_14_15$MP),])
#13-14
CL_13_14_fin <- (CL_DF_13_14[!is.na(CL_DF_13_14$MP),])


#removing country labels from soccer teams

CL_19_20_fin$Squad <- gsub("^.{0,3}", "", CL_19_20_fin$Squad)

CL_18_19_fin$Squad <- gsub("^.{0,3}", "", CL_18_19_fin$Squad)

CL_17_18_fin$Squad <- gsub("^.{0,3}", "", CL_17_18_fin$Squad)

CL_16_17_fin$Squad <- gsub("^.{0,3}", "", CL_16_17_fin$Squad)

CL_15_16_fin$Squad <- gsub("^.{0,3}", "", CL_15_16_fin$Squad)

CL_14_15_fin$Squad <- gsub("^.{0,3}", "", CL_14_15_fin$Squad)

CL_13_14_fin$Squad <- gsub("^.{0,3}", "", CL_13_14_fin$Squad)


# filter to top teams and change team to squad, filter each league
colnames(season_stats_df)[1] <- "League"
colnames(season_stats_df)[2] <- "Year"
full_epl <- season_stats_df  %>% dplyr::filter(League == "EPL")
full_ligue <- season_stats_df  %>% dplyr::filter(League == "Ligue_1")
full_bundes <- season_stats_df  %>% dplyr::filter(League == "Bundesliga")
season_stats_filtered_df <- filter(season_stats_df, position < 6)

#change column names
colnames(season_stats_filtered_df)[2] <- "Year"
colnames(season_stats_filtered_df)[1] <- "League"



#filter out leagues I don't want to study
#russian league
season_stats_filtered_df <- filter(season_stats_filtered_df, League != "RFPL")

#spanish league
season_stats_filtered_df <- filter(season_stats_filtered_df, League != "La_liga")

# Italian league
season_stats_filtered_df <- filter(season_stats_filtered_df, League != "Serie_A")


# adding years to champions league data frames to make joins better
CL_13_14_fin$Year <- "2013_2014"
CL_14_15_fin$Year <- "2014_2015"
CL_15_16_fin$Year <- "2015_2016"
CL_16_17_fin$Year <- "2016_2017"
CL_17_18_fin$Year <- "2017_2018"
CL_18_19_fin$Year <- "2018_2019"
CL_19_20_fin$Year <- "2019_2020"



#fixing years in season data to match up champions league data
#could probably do with a for loop but figure it out rn look back at later
season_stats_filtered_df["Year"][season_stats_filtered_df["Year"] == "2014"] <- "2014_2015"

season_stats_filtered_df["Year"][season_stats_filtered_df["Year"] == "2015"] <- "2015_2016"

season_stats_filtered_df["Year"][season_stats_filtered_df["Year"] == "2016"] <- "2016_2017"

season_stats_filtered_df["Year"][season_stats_filtered_df["Year"] == "2017"] <- "2017_2018"

season_stats_filtered_df["Year"][season_stats_filtered_df["Year"] == "2018"] <- "2018_2019"

season_stats_filtered_df["Year"][season_stats_filtered_df["Year"] == "2019"] <- "2019_2020"


#try to remove columns from CL data for 16-17
col_remove <- c("Rk","Attendance","Top Team Scorer", "Goalkeeper", "Notes")

Cln_CL_13_14 <- CL_13_14_fin %>%
  select(- one_of(col_remove))


Cln_CL_14_15 <- CL_14_15_fin %>%
  select(- one_of(col_remove))

Cln_CL_15_16 <- CL_15_16_fin %>%
  select(- one_of(col_remove))

Cln_CL_16_17 <- CL_16_17_fin %>%
  select(- one_of(col_remove))

Cln_CL_17_18 <- CL_17_18_fin %>%
  select(- one_of(col_remove))

#remove unneeded columns for 18-19 and further
col_remove2 <- c("Rk","Attendance","Top Team Scorer", "Goalkeeper", "Notes","xG","xGA","xGD","xGD/90")

Cln_CL_18_19 <- CL_18_19_fin %>%
  select(- one_of(col_remove2))

Cln_CL_19_20 <- CL_19_20_fin %>%
  select(- one_of(col_remove2))




#change MP to CL_MP to distinguish variable
Cln_CL_13_14 <- rename(Cln_CL_13_14, CL_MP = MP)
Cln_CL_14_15 <- rename(Cln_CL_14_15, CL_MP = MP)
Cln_CL_15_16 <- rename(Cln_CL_15_16, CL_MP = MP)
Cln_CL_16_17 <- rename(Cln_CL_16_17, CL_MP = MP)
Cln_CL_17_18 <- rename(Cln_CL_17_18, CL_MP = MP)
Cln_CL_18_19 <- rename(Cln_CL_18_19, CL_MP = MP)
Cln_CL_19_20 <- rename(Cln_CL_19_20, CL_MP = MP)


#remove whitespace from CL data (prem teams rows off)
Cln_CL_13_14$Squad <- trimws(Cln_CL_13_14$Squad, which = c("left"))
Cln_CL_14_15$Squad <- trimws(Cln_CL_14_15$Squad, which = c("left"))
Cln_CL_15_16$Squad <- trimws(Cln_CL_15_16$Squad, which = c("left"))
Cln_CL_16_17$Squad <- trimws(Cln_CL_16_17$Squad, which = c("left"))
Cln_CL_17_18$Squad <- trimws(Cln_CL_17_18$Squad, which = c("left"))
Cln_CL_18_19$Squad <- trimws(Cln_CL_18_19$Squad, which = c("left"))
Cln_CL_19_20$Squad <- trimws(Cln_CL_19_20$Squad, which = c("left"))



#need to merge CL data
CL_merged <- do.call("rbind", list(Cln_CL_14_15, Cln_CL_15_16, Cln_CL_16_17, Cln_CL_17_18, Cln_CL_18_19, Cln_CL_19_20))



#refine season_stats_filtered
szn_stats <- season_stats_filtered_df

#EPL league data
epl_data = season_stats_filtered_df %>% dplyr::filter(League == "EPL")

#Ligue one data
ligue_data = szn_stats %>% dplyr::filter(League == "Ligue_1")

#Bundesliga data
bundes_data = szn_stats %>% dplyr::filter(League == "Bundesliga")

#EPL data linear regression top 5
lm_EPL <- lm(xpts ~ deep + npxG + npxGA + xGA + ppda_coef, data=epl_data)
summary(lm_EPL)

#see how well our model predicts expected points
summary(epl_data$xpts - lm_EPL$fitted.values)

#residual plot for EPL top 5
EPL_res <- resid(lm_EPL)
res_plot_EPL <- plot(epl_data$xpts, EPL_res, ylab = "Residuals",
                     xlab = "Expected points",
                     main = "Top 5 Premier Leauge expected Points",
                     abline(0,0))

#linear regression and residual plot for entire prem
lm_full_EPL <- lm(xpts ~ deep + npxG + npxGA + xGA + ppda_coef, data=full_epl)
summary(lm_full_EPL)
full_EPL_res <- resid(lm_full_EPL)
rplot_fEPL <- plot(full_epl$xpts, full_EPL_res, ylab = "Residuals",
                   xlab = "Expcted points",
                   main = "All premier League expcted Points",
                   abline(0,0))


#linear regression ligue one
lm_ligue <- lm(xpts ~ deep + npxG + npxGA + xGA + ppda_coef, data=ligue_data)
summary(lm_ligue)

#see how well our model predicts expected points
summary(ligue_data$xpts - lm_ligue$fitted.values)

#residual plot for Ligue top 5
Ligue_res <- resid(lm_ligue)
res_plot_ligue <- plot(ligue_data$xpts, Ligue_res, ylab = "Residuals",
                       xlab = "Expected points",
                       main = "Top 5 Ligue one expected Points",
                       abline(0,0))
#linear regression and residual plot for entire ligue_one
lm_full_ligue <- lm(xpts ~ deep + npxG + npxGA + xGA + ppda_coef, data=full_ligue)
summary(lm_full_ligue)
full_ligue_res <- resid(lm_full_ligue)
rplot_fligue <- plot(full_ligue$xpts, full_ligue_res, ylab = "Residuals",
                   xlab = "Expcted points",
                   main = "All Ligue one expcted Points",
                   abline(0,0))
#seems to be some leakage so look at distribution of residuals
qqnorm(full_ligue_res)
qqline(full_ligue_res)
#can see that on the lower end of the line the residuals are of the line
# so the residuals are not normally distributed. HOW TO FIX THIS?


#bundesliga regression
lm_bundes <- lm(xpts ~ deep + npxG + npxGA + xGA + ppda_coef, data=bundes_data)
summary(lm_bundes)

#see how well our model predicts expected points
summary(bundes_data$xpts - lm_bundes$fitted.values)

#bundesliga top 5 residual plot
bundes_res <- resid(lm_bundes)
res_plot_bundes <- plot(bundes_data$xpts, bundes_res, ylab = "Residuals",
                       xlab = "Expected points",
                       main = "Top 5 Bundesliga expected Points",
                       abline(0,0))

#bundes resid plot #? why won't it save
lm_full_bundes <- lm(xpts ~ deep + npxG + npxGA + xGA + ppda_coef, data=full_bundes)
summary(lm_full_bundes)
full_bundes_res <- resid(lm_full_bundes)
rplot_fbundes <- plot(full_bundes$xpts, full_bundes_res, ylab = "Residuals",
                     xlab = "Expcted points",
                     main = "All Bundesliga expcted Points",
                     abline(0,0))
#qqnorm plot
qqnorm(full_bundes_res)
qqline(full_bundes_res)
#pretty normally distributed

#scatter plots seeing "deep" relationship to expected points
scatter.smooth(x=epl_data$deep, y=epl_data$xpts, xlab = "Deep passes",
               ylab = "Expcted points")  # scatterplot

#same plot as above but with ggplot (deep) epl
ggplot(full_epl, aes(deep,xpts, colour = deep)) +
  geom_point() +
  geom_smooth(span = 10)

#bundesliga
ggplot(full_bundes, aes(deep,xpts, colour = deep)) +
  geom_point() +
  geom_smooth(span = 10)

#ligue one
ggplot(full_epl, aes(deep,xpts, colour = deep)) +
  geom_point() +
  geom_smooth(span = 10)

#for the prem
# expected goals per season without penalties
ofs_epl <- ggplot(full_epl, aes(npxG,xpts)) +
  geom_point() +
  geom_smooth(span = 1) +
  ggtitle("Expected Points based on Goals for in a season prem")

#expected goals against without penalties and own goals
def_epl <- ggplot(full_epl, aes(npxGA,xpts)) +
  geom_point() +
  geom_smooth(span = 1) +
  ggtitle("Expected Points based on Goals against in a season prem")


grid.arrange(ofs_epl, def_epl, ncol = 2)

#for ligue one
ofs_ligue <- ggplot(full_ligue, aes(npxG,xpts)) +
  geom_point() +
  geom_smooth(span = 1) +
  ggtitle("Expected Points based on Goals for in a season ligue one")

#expected goals against without penalties and own goals
def_ligue <- ggplot(full_ligue, aes(npxGA,xpts)) +
  geom_point() +
  geom_smooth(span = 1) +
  ggtitle("Expected Points based on Goals against in a season ligue one")


grid.arrange(ofs_ligue, def_ligue, ncol = 2)

#for bundesliga
ofs_bundes <- ggplot(full_bundes, aes(npxG,xpts)) +
  geom_point() +
  geom_smooth(span = 1) +
  ggtitle("Expected Points based on Goals for in a season bundesliga")

#expected goals against without penalties and own goals
def_bundes <- ggplot(full_bundes, aes(npxGA,xpts)) +
  geom_point() +
  geom_smooth(span = 1) +
  ggtitle("Expected Points based on Goals against in a season bundesliga")


grid.arrange(ofs_bundes, def_bundes, ncol = 2)

#variable descriptions
#npxG - expected goals without penalties and own goals
#xGA_diff - difference between expected goals against and missed
#npxGA - expected goals against without penalties and own goals
#npxGD - difference between for and against expected goals without penalties and own goals
#ppda_coef - passes per defensive action in opposing half
#oppda_coef - opponent passes allowed per defenseive action in opposition half
#deep - passes completed within 20 yards of goal, crosses excluded
#xpts - expected points


#try to build oot model for Bayern
#use pergame data?
team_pergame_df <- read.csv("understat_per_game.csv")
Bayern<-team_pergame_df %>% filter((team) == 'Bayern Munich') #%>% filter((year) == '2014')

Bayren_oot = Bayern[Bayern$year > 2018,]

Bayern_modeling = Bayern[Bayern$year <= 2018,]

mod_bayern = Bayern_modeling[,-c(1,2,3,4,14,15,17,18,19)]
mod_bayern1 = mod_bayern
 
bayern_train_iters = sample(1:nrow(mod_bayern), .9*nrow(mod_bayern))
bayern_train_df = mod_bayern1[bayern_train_iters,]
bayern_test_df = mod_bayern1[-bayern_train_iters,]

bayern_train_matrix = model.matrix(~ .,data = bayern_train_df)[,-c(1)]
bayern_test_matrix = model.matrix(~ ., data = bayern_test_df)[,-c(1)]


#model testing
#lasso
lambda = exp(seq(-15,15, length=100))
#wins variable is the response variable and is the 10th column
bayern_lasso_lm = glmnet(bayern_train_matrix[,-c(10)],bayern_train_matrix[,10],alpha = 1, lambda = lambda,family = "binomial")

plot(bayern_lasso_lm)
bayern_lasso_cv = cv.glmnet(bayern_train_matrix[,-c(10)],bayern_train_matrix[,10],alpha = 1, lambda = lambda,family = "binomial")
bayern_bestlam = bayern_lasso_cv$lambda.min
plot(bayern_lasso_cv)
Bay_las_coef = predict(bayern_lasso_lm, s = bayern_bestlam, type = "coefficient")
Bay_vars = names(Bay_las_coef[Bay_las_coef[,1]!=0,][-c(1)])


#oot model for PSG
PSG<-team_pergame_df %>% filter((team) == 'Paris Saint Germain') #%>% filter((year) == '2014')

PSG_oot = PSG[PSG$year > 2018,]

PSG_modeling = PSG[PSG$year <= 2018,]

mod_PSG = PSG_modeling[,-c(1,2,3,4,14,15,17,18,19)]
mod_PSG1 = mod_PSG

PSG_train_iters = sample(1:nrow(mod_PSG), .9*nrow(mod_PSG))
PSG_train_df = mod_PSG1[PSG_train_iters,]
PSG_test_df = mod_PSG1[-PSG_train_iters,]

PSG_train_matrix = model.matrix(~ .,data = PSG_train_df)[,-c(1)]
PSG_test_matrix = model.matrix(~ ., data = PSG_test_df)[,-c(1)]


#model testing
#lasso
lambda = exp(seq(-15,15, length=100))
#wins variable is the response variable and is the 10th column
PSG_lasso_lm = glmnet(PSG_train_matrix[,-c(10)],PSG_train_matrix[,10],alpha = 1, lambda = lambda,family = "binomial")

plot(PSG_lasso_lm)
PSG_lasso_cv = cv.glmnet(PSG_train_matrix[,-c(10)],PSG_train_matrix[,10],alpha = 1, lambda = lambda,family = "binomial")
PSG_bestlam = PSG_lasso_cv$lambda.min
plot(PSG_lasso_cv)
PSG_las_coef = predict(PSG_lasso_lm, s = PSG_bestlam, type = "coefficient")
PSG_vars = names(PSG_las_coef[PSG_las_coef[,1]!=0,][-c(1)])

#oot model for manchester City
man_city<-team_pergame_df %>% filter((team) == 'Manchester City') #%>% filter((year) == '2014')

man_city_oot = man_city[man_city$year > 2018,]

man_city_modeling = man_city[man_city$year <= 2018,]

mod_man_city = man_city_modeling[,-c(1,2,3,4,14,15,17,18,19)]
mod_man_city1 = mod_man_city

man_city_train_iters = sample(1:nrow(mod_man_city), .9*nrow(mod_man_city))
man_city_train_df = mod_man_city1[man_city_train_iters,]
man_city_test_df = mod_man_city1[-man_city_train_iters,]

man_city_train_matrix = model.matrix(~ .,data = man_city_train_df)[,-c(1)]
man_city_test_matrix = model.matrix(~ ., data = man_city_test_df)[,-c(1)]


#model testing
#lasso
lambda = exp(seq(-15,15, length=100))
#wins variable is the response variable and is the 10th column
man_city_lasso_lm = glmnet(man_city_train_matrix[,-c(10)],man_city_train_matrix[,10],alpha = 1, lambda = lambda,family = "binomial")

plot(man_city_lasso_lm)
man_city_lasso_cv = cv.glmnet(man_city_train_matrix[,-c(10)],man_city_train_matrix[,10],alpha = 1, lambda = lambda,family = "binomial")
man_city_bestlam = man_city_lasso_cv$lambda.min
plot(man_city_lasso_cv)
man_city_las_coef = predict(man_city_lasso_lm, s = man_city_bestlam, type = "coefficient")
man_city_vars = names(man_city_las_coef[man_city_las_coef[,1]!=0,][-c(1)])
#from all of these models the most signficant variables are 'scored', 'xpts', and 'xpts_dif'

#want to do one rf/GB with manchester City data
#rf_mod = randomForest(as.factor(wins) ~., data=data.frame(man_city_train_matrix))



#lambda modeling for season stats

y <- full_epl$pts
x <- data.matrix(full_epl[,c('deep', 'npxG', 'npxGA', 'xGA', 'ppda_coef')])

pl_lamb_model <- cv.glmnet(x,y, alpha=1)
pl_best_lamb <- pl_lamb_model$lambda.min
#value with lowest MSE is 
pl_best_lamb

best_model <- glmnet(x,y,alpha = 1, lambda = pl_best_lamb)
coef(best_model)

#test model with practice data set for premier league 
experiment = matrix(c(350,45,40,50,10),nrow = 1, ncol = 5)
predict(best_model, s = pl_best_lamb, newx = experiment)

y_predicted <- predict(best_model, s = pl_best_lamb, newx = x)
sst <- sum((y-mean(y))^2)
sse <- sum((y_predicted - y)^2)

rsq <- 1 - sse/sst
rsq




#boxplots of leagues
epl_box <- boxplot(full_epl$pts, ylab = "full season points",
        xlab = "Premier League",
        notch = TRUE,
        col = "gold")

#attempted ggplot
epl_ggbox <- ggplot(data = full_epl,
                    mapping = aes(x = League, y = pts)) +
            geom_boxplot() +
            labs(x = "League", y = "Season Points")

bundes_box <- boxplot(full_bundes$pts, ylab = "full season points",
        xlab = "Bundesliga",
        notch = TRUE,
        col = "red")

ligue_box <- boxplot(full_ligue$pts, ylab = "full season points",
        xlab = "Ligue One",
        notch = TRUE,
        col = "blue")


#boxplots side by side
bx1 <- full_epl$pts
bx2 <- full_bundes$pts
bx3 <- full_ligue$pts

#side by side box plot 
sbs_bp<-boxplot(bx1,bx2,bx3, 
        names = c("Premier League", "Bundesliga", "Ligue One"),
        ylab = "Season Points")


# ggplot of boxplots side by side colored whoo
season_bind <- rbind(full_epl, full_bundes, full_ligue)
season_bind %>% 
  ggplot( aes(x = League, y = pts, fill = League )) + geom_boxplot()

#find average differences in 1st place points for each league between 2nd,3rd, and 4th place
epl_data[epl_data$position == '1',] %>% select(pts) %>% summarise(mean(pts))
epl_data[epl_data$position == '2',] %>% select(pts) %>% summarise(mean(pts))



#for loops finding average difference between 1st and remaining top 4 positions in each league
for (i in 2:4) {
  test<-epl_data[epl_data$position == paste(1),] %>% summarise(mean(pts))
  test2 <- epl_data[epl_data$position == paste(i),] %>% summarise(mean(pts))
  print(test - test2)
  #save as a df within here and then plot the df
  # This was the loop that inspired the dataframe below
}

#right under here is the for loop that put average distance from first place into a dataframe

epl_pos_df <- data.frame(first_pts = rep(NA,1))
epl_pos_df

for (i in 2:4) {
  epl_col <- rep(epl_data[epl_data$position == paste(1),] %>% summarise(mean(pts)),1)
  #epl_pos_df[,1] <- epl_col
  old_col <- epl_data[epl_data$position == paste(i),] %>% summarise(mean(pts))
  epl_pos_df[,i-1] <- epl_col - old_col
  colnames(epl_pos_df)[1] <- paste0("2nd avg_pts_off_first")
  colnames(epl_pos_df)[2] <- paste0("3rd avg_pts_off_first")
  colnames(epl_pos_df)[3] <- paste0("4th avg_pts_off_first")
}

epl_pos_df

barplot(t(as.matrix(epl_pos_df)), beside = TRUE, main = "EPL average gap between first and top 4",
        names.arg = c("2nd", "3rd", "4th"),
        xlab = "Position at end of season", ylab = "Average points off first",
        col = c("red", "blue", "green"),
        ylim = c(0,30))

#loop for ligue one mean differences between 1 and top 4
ligue_data[ligue_data$position == '1',] %>% select(pts)
for (i in 2:4) {
  test<-ligue_data[ligue_data$position == paste(1),] %>% summarise(mean(pts))
  test2 <- ligue_data[ligue_data$position == paste(i),] %>% summarise(mean(pts))
  print(test - test2)
}

#for loop into dataframe for ligue one mean differences between 1 and 4

ligue_pos_df <- data.frame(first_pts = rep(NA,1))
ligue_pos_df

for (i in 2:4) {
  ligue_col <- rep(ligue_data[ligue_data$position == paste(1),] %>% summarise(mean(pts)),1)
  #ligue_pos_df[,1] <- ligue_col
  ligue_old_col <- ligue_data[ligue_data$position == paste(i),] %>% summarise(mean(pts))
  ligue_pos_df[,i-1] <- ligue_col - ligue_old_col
  colnames(ligue_pos_df)[1] <- paste0("2nd avg_pts_off_first")
  colnames(ligue_pos_df)[2] <- paste0("3rd avg_pts_off_first")
  colnames(ligue_pos_df)[3] <- paste0("4th avg_pts_off_first")
}

ligue_pos_df

barplot(t(as.matrix(ligue_pos_df)), beside = TRUE,main = "Ligue One average gap between first and top 4",
        names.arg = c("2nd", "3rd", "4th"),
        xlab = "Position at end of season", ylab = "Average points off first",
        col = c("red", "blue", "green"),
        ylim = c(0,30))

# for loop that showed mean differences between 1 and top 4 in bundesliga
bundes_data[bundes_data$position == '1',] %>% select(pts)
for (i in 2:4) {
  test<-bundes_data[bundes_data$position == paste(1),] %>% summarise(mean(pts))
  test2 <- bundes_data[bundes_data$position == paste(i),] %>% summarise(mean(pts))
  print(test - test2)
}

# for loop that put mean differences between 1 and 4 of bundesliga into a df
bundes_pos_df <- data.frame(first_pts = rep(NA,1))
bundes_pos_df

for (i in 2:4) {
  bundes_col <- rep(bundes_data[bundes_data$position == paste(1),] %>% summarise(mean(pts)),1)
  #bundes_pos_df[,1] <- bundes_col
  bundes_old_col <- bundes_data[bundes_data$position == paste(i),] %>% summarise(mean(pts))
  bundes_pos_df[,i-1] <- bundes_col - bundes_old_col
  colnames(bundes_pos_df)[1] <- paste0("2nd avg_pts_off_first")
  colnames(bundes_pos_df)[2] <- paste0("3rd avg_pts_off_first")
  colnames(bundes_pos_df)[3] <- paste0("4th avg_pts_off_first")
}

bundes_pos_df

barplot(t(as.matrix(bundes_pos_df)), beside = TRUE,main = "Bundesliga average gap between first and top 4",
        names.arg = c("2nd", "3rd", "4th"),
        xlab = "Position at end of season", ylab = "Average points off first",
        col = c("red", "blue", "green"),
        ylim = c(0,30))

#merge champions league with season stats
#note: only applicable to teams that actually played in champions league and finished top 5 that season
names(szn_stats)[4] <- "Squad"
CL_SZN_MERGE = merge(szn_stats, CL_merged, by = c("Year", "Squad"))
scatter.smooth(x=epl_data$deep, y=epl_data$xpts)# scatterplot


