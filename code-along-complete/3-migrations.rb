# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along-complete/3-migrations.rb

# **************************
# Don't change or move
Salesperson.destroy_all
# **************************

# Add new Salesperson model with database table

# 1. in terminal, run:
# rails generate model Salesperson

# 2. open newly generated files

# 3. add relevant columns to the db/migrate file:
# first_name, last_name, email

# 4. execute the migration file. in terminal, run:
# rails db:migrate

# pay attention to the SQL in the log
# check the schema to confirm the change

# 5. insert new rows in the table

salesperson = Salesperson.new
salesperson.first_name = "Brian"
salesperson.last_name = "Forhan"
salesperson.email = "brian.forhan@email.com"
salesperson.save 

