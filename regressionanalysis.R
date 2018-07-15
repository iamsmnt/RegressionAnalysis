library(ggplot2)



cancer_data = read.csv('cancer_reg.csv')


sum(is.na(cancer_data$avganncount))

##################################Missing Values Analysis###############################################
missing_val = data.frame(apply(cancer_data,2,function(x){sum(is.na(x))}))
missing_val$Columns = row.names(missing_val)
names(missing_val)[1] =  "Missing_percentage"
missing_val$Missing_percentage = (missing_val$Missing_percentage/nrow(cancer_data)) * 100
missing_val = missing_val[order(-missing_val$Missing_percentage),]
row.names(missing_val) = NULL
missing_val = missing_val[,c(2,1)]
write.csv(missing_val, "Missing_perc.csv", row.names = F)

ggplot(data = missing_val[1:3,], aes(x=reorder(Columns, -Missing_percentage),y = Missing_percentage))+
   geom_bar(stat = "identity",fill = "green")+xlab("Parameter")+
   ggtitle("Missing data percentage (Train)") + theme_bw()
