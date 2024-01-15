require "pry"
require_relative "classes"

get "/" do
  erb :index
end

get "/contacts" do
  @contact_list = session[:contact_list].contacts

  erb :contacts
end

get "/newcontact" do
  erb :newcontact
end

post "/contacts" do
  session[:contact_list] = ContactList.new if !session[:contact_list]
  new_contact = Contact.new(params[:name], params[:email], params[:phone])
  #binding.pry
  session[:contact_list].add_contact(new_contact)
  redirect "/contacts"
end

get "/contacts/:id" do
  contact_id = params[:id].to_i
  contact_list = session[:contact_list]
  @contact = contact_list.get_contact(contact_id)

  erb :contactdetails
end

post "/contacts/:id/delete" do
  contact_id = params[:id]
  contact_list = session[:contact_list]

  contact_list.delete_id!(contact_id)
  redirect "/contacts"
end

get "/contacts/:id/edit" do
  contact_id = params[:id].to_i
  contact_list = session[:contact_list]

  @contact = contact_list.get_contact(contact_id)
  erb :editcontact
end

post "/contacts/:id/edit" do
  contact_id = params[:id].to_i
  contact_list = session[:contact_list]
  contact = contact_list.get_contact(contact_id)

  contact.edit(params[:name], params[:email], params[:phone])
  redirect "/contacts"
end
