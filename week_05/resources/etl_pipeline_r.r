# Databricks notebook source
# MAGIC %md %md # WORKSHOP - Data Pipeline in Practice

# COMMAND ----------

# MAGIC %md #### Step 1 Read in Datasets

# COMMAND ----------

library(SparkR)
library(sparklyr)
library(dplyr)
library(lubridate)

# COMMAND ----------

SparkR::sparkR.session()

# COMMAND ----------

sc <- spark_connect(method = "databricks")

# COMMAND ----------

df_source_laptimes <- spark_read_csv (sc, name =“lap_times”, path=“/mnt/ne-gr5069/raw/lap_times.csv”)

# COMMAND ----------

df_laptimes <- collect(df_source_laptimes)
dim(df_laptimes)

# COMMAND ----------

df_source_drivers <- spark_read_csv (sc, name ="drivers", path="/mnt/ne-gr5069/raw/drivers.csv")
df_drivers <- collect(df_source_drivers)
dim(df_drivers)

# COMMAND ----------

glimpse(df_drivers)

# COMMAND ----------

# MAGIC %md #### Transform Data 

# COMMAND ----------

#Change type of 'dob' to Date 
df_drivers <- df_drivers %>%
  mutate(dob = as.Date(dob))

# COMMAND ----------

#create an age variable and convert it to integer
df_drivers <- df_drivers %>%
  mutate(age = as.integer((today()-dob)/366))
glimpse(df_drivers)

# COMMAND ----------

#merge datasets by the common column
df_driver_laptime <- merge(df_drivers, df_laptimes, by = "driverId")
dim(df_driver_laptime)

# COMMAND ----------

# MAGIC %md #### Aggregate Data by Age

# COMMAND ----------

df_laptime_age <- df_driver_laptime %>% 
                  filter(age < 30)

# COMMAND ----------

glimpse(df_laptime_age)

# COMMAND ----------

df_laptime_age_agg <- df_laptime_age %>%
  group_by(age) %>%
  summarise(mean= mean(milliseconds))

# COMMAND ----------

df_laptime_age_agg

# COMMAND ----------

tbl <- copy_to(sc, df_laptime_age_agg, OVERWRITE=TRUE)
spark_write_csv(tbl, '/mnt/ne-gr5069/interim/by_age_laptimes_R.csv')
