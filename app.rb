require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/contact")
require("./lib/phone")



get ("/") do
  @contacts = Contact.all()
  erb(:index)
end

post ("/contacts") do
  name = params.fetch("name")
  email = params.fetch("email")
  contact = Contact.new({:name => name, :email => email})
  contact.save()
  redirect ('/')
end

get("/contact/:id") do
  @contact = Contact.find(params.fetch("id").to_i())
  erb(:contact)
end

post ("/phones") do
  @contact = Contact.find(params.fetch("contact_id").to_i())
  number = params.fetch("number")
  type = params.fetch("type")
  @phone = Phone.new({:number => number, :type => type})
  @phone.save()
  @contact.add_number(@phone)
  redirect back
end
