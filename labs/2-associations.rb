# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-associations.rb

# 1. write code to display each contact (you can reuse the previous lab's code) and include the contact's company name, e.g.:

Contact.destroy_all
Company.destroy_all

# ---------------------------------
# Contacts: 4
# Andy Jassy - andy@amazon.com - Amazon.com, Inc.
# Craig Federighi - craig@apple.com - Apple Inc.
# Elon Musk - elon@tesla.com - Tesla, Inc.
# Tim Cook - tim@apple.com - Apple Inc.

values = { name: "Apple Inc.", url: "https://www.apple.com", city: "Cupertino", state: "CA" }
apple = Company.new(values)
apple.save

values = { name: "Amazon Inc.", url: "https://www.amazon.com", city: "Seattle", state: "WA" }
amazon = Company.new(values)
amazon.save

apple = Company.where({ name: "Apple Inc." })[0]
apple_id = apple.read_attribute(:id)

amazon = Company.where({ name: "Amazon Inc." })[0]
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

puts "Contacts: #{Contact.all.count}"
contacts = Contact.all
company = Company.where(id: contact.company_id)[0]
for contact in contacts
    puts "#{contact.first_name} #{contact.last_name} - #{contact.email} #{company.name}"
end 

# 2. similar to above, but this time organized by company, write code to display each company (name) and its contacts, e.g.:

contacts = Contact.all
company = Company.where(id: contact.company_id)[0]
for contact in contacts
    puts "#{company.name}
    #{contact.first_name} #{contact.last_name}
    #{contact.email}
    "
end 


# ---------------------------------
# Apple Inc.
# Tim Cook - tim@apple.com
# Craig Federighi - craig@apple.com
#
# Amazon.com, Inc.
# Andy Jassy - andy@amazon.com
#
# Tesla, Inc.
# Elon Musk - elon@tesla.com
