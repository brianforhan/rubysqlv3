# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/1-models.rb

# **************************
# Don't change or move
Contact.destroy_all
Company.destroy_all

# **************************

# 1a. check out the schema file
# 1b. check out the model file

# 2. create 1-2 new contacts for each company (they can be made up)

values = { name: "Apple Inc.", url: "https://www.apple.com", city: "Cupertino", state: "CA" }
apple = Company.new(values)
apple.save

values = { name: "Amazon.com, Inc.", url: "https://www.amazon.com", city: "Seattle", state: "WA" }
amazon = Company.new(values)
amazon.save

apple = Company.where({ name: "Apple Inc." })[0]
apple_id = apple.read_attribute(:id)

amazon = Company.where({ name: "Amazon.com, Inc." })[0]
amazon_id = amazon.read_attribute(:id)

values = { first_name: "Tim", last_name: "Cook", email: "tim@apple.com", phone_number: "777-777-7777", company_id: apple_id }
contact = Contact.new(values)
contact.save

values = { first_name: "Craig", last_name: "Federighi", email: "craig@apple.com", phone_number: "888-888-8888", company_id: apple_id }
contact = Contact.new(values)
contact.save

values = { first_name: "Andy", last_name: "Jassy", email: "andy@amazon.com", phone_number: "666-666-6666", company_id: amazon_id }
contact = Contact.new(values)
contact.save

# 3. write code to display how many contacts are in the database AND each contact's info (name, email), e.g.:

# ---------------------------------
# Contacts: 4
# Andy Jassy - andy@amazon.com
# Craig Federighi - craig@apple.com
# Elon Musk - elon@tesla.com
# Tim Cook - tim@apple.com

"Contacts: #{Contact.all.count}"
contacts = Contact.all
for contact in contacts
    puts "#{contact.first_name} #{contact.last_name} - #{contact.email}"
end 

amazon_id = amazon_id
contacts = Contact.where(company_id: amazon_id)

puts "Contacts at Amazon: #{contacts.count}"
for contact in contacts
    puts "#{contact.first_name} #{contact.last_name}"
end