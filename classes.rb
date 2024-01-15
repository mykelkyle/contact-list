class Contact
  @@contacts = 1
  attr_reader :id, :name, :email, :phone

  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
    @id = @@contacts
    @@contacts += 1
  end

  def edit(name, email, phone)
    @name = name
    @email = email
    @phone = phone
  end
end

class ContactList
  attr_accessor :contacts
  @@contact_list = false

  def self.any?
    @@contact_list
  end

  def initialize
    @contacts = []
    @@contact_list = true
  end

  def add_contact(contact)
    @contacts << contact
  end

  def delete_id!(id)
    contact_id = id.to_i

    @contacts.delete_if { |contact| contact.id == contact_id }
  end

  def get_contact(id)
    contact_id = id.to_i

    @contacts.find { |contact| contact.id == contact_id }
  end
end
