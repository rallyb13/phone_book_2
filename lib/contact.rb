class Contact
  @@contacts = []
  attr_reader(:name, :email, :id, :numbers)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @email = attributes[:email]
    @id = @@contacts.length().+(1)
    @numbers = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |search_id|
    Contact.all().each() do |contact|
      if contact.id() == search_id
        return contact
      end
    end
  end

  define_method(:add_number) do |phone|
    @numbers.push(phone)
  end

end