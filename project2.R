#internet ussage 

int_user <- read.csv(file.choose())
int_user

View(int_user)

head(int_user)


#making columns more readable 

colnames(int_user) <- c('country_name','country_code','birth_rate','internet_users','income_group')
colnames(int_user)

head(int_user)

int_user[int_user$income_group == 'High income',]

#analysis between birth rate aand internet ussage  

library(ggplot2)

ggplot(data = int_user, aes(x=birth_rate, y=internet_users))+geom_point()


ggplot(data = int_user, aes(x=birth_rate, y=internet_users))+geom_point(colour = 'red')


ggplot(data = int_user, aes(x=birth_rate, y=internet_users, size = I(1)))+geom_point(colour = 'red')+
  xlab('birth rate')+ylab('internet users')+theme(axis.title.x = element_text(size = 20, colour = 'dark green'), axis.title.y = element_text(size=20,colour = 'dark blue'))
    
thme <- theme(axis.title.x = element_text(size = 20, colour = 'dark green'), axis.title.y = element_text(size=20,colour = 'dark blue'))

#visualisation on the basis of income group 

ggplot(data = int_user, aes(x=birth_rate, y=internet_users, size = I(1.5), col=income_group))+geom_point()+thme

ggplot(data = int_user, aes(x=birth_rate, y=internet_users, size = I(1.5), col=income_group))+geom_point()+geom_smooth(fill=NA, size=1)

ggplot(data = int_user, aes(x=birth_rate, y=internet_users, size = I(1.5), col=income_group))+geom_point()+geom_smooth(fill=NA, size=1)+facet_grid(income_group~., space = 'free')+thme

#analysis of income group against internet usage

ggplot(data =  int_user, aes(x=internet_users))+geom_histogram(fill = 'black')+facet_grid(income_group~., space = 'free')+thme


#comparing india with other major countries highincome


highincome <- int_user[int_user$income_group == 'High income',]
highincome

highincome[1:10,]

aruba <- c(int_user[int_user$country_name == 'Aruba',])
aruba

uae <- c(int_user[int_user$country_name == 'United Arab Emirates',])
uae

argentina <- c(int_user[int_user$country_name == 'Argentina',])
argentina

australia <- c(int_user[int_user$country_name == 'Australia',])
australia

austria <- c(int_user[int_user$country_name == 'Austria',])
austria

belgium <- c(int_user[int_user$country_name == 'Belgium',])
belgium

bermuda <- c(int_user[int_user$country_name == 'Bermuda',])
bermuda


india <- c(int_user[int_user$country_name == 'India',])
india

usa   <- c(int_user[int_user$country_code == 'USA',])
usa


india_compare <- rbind(india , usa, aruba, uae, argentina, australia, austria, belgium, bermuda ) 
india_compare


indataframe <- data.frame(india_compare)
indataframe

indataframe$birth_rate
indataframe$internet_users


rownames(indataframe) <- NULL
indataframe

indataframe

head(indataframe)

library(writexl)

write.xlsx(indataframe, "C:\\Users\\ASUS\\Desktop\\R files\\internet usage\\newdata.xlsx", col_names = TRUE, format_header = TRUE)

n <- read.xlsx(file.choose())
n

ncol(n)
nrow(n)


library(ggplot2)

ggplot(data = n, aes(x=birth_rate, y=internet_users, col = country_name, size = 3))+geom_point()+xlab('birthrate')+ylab('internet ussage') +
                                      theme(axis.title.x = element_text(colour = 'Red', size = 20) ,
                                            axis.title.y = element_text(colour = 'Green', size = 20),
                                            axis.text.x = element_text(size = 10),
                                            axis.text.y = element_text(size = 10),
                                            legend.title = element_text(size = 30),
                                            legend.text = element_text(size=20),
                                            legend.position = c(1,1),
                                            
                                            )











































