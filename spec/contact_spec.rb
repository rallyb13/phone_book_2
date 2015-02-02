require("rspec")
require("contact")
require("phone")

describe(Contact) do
  before do
    Contact.clear()
  end

  describe(".all") do
    it("is empty at first") do
      test_buddy = Contact.new({:name => "Squirrel", :email => "ee@ee.eee"})
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a new contact into the list") do
      test_buddy = Contact.new({:name => "Sarah Conner"})
      test_buddy.save()
      expect(Contact.all()).to(eq([test_buddy]))
    end
  end

  describe(".clear") do
    it("empties the list") do
      test_buddy = Contact.new({:name => "Andrew Jackson"})
      test_buddy.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the contact's name") do
      test_buddy = Contact.new({:name => "Frank Sinatra"})
      test_buddy.save()
      expect(test_buddy.name()).to(eq("Frank Sinatra"))
    end
  end

  describe("#email") do
    it("returns the contact's email") do
      test_buddy = Contact.new({:name => "Worf", :email => "DS9 ext. Defiant"})
      test_buddy.save()
      expect(test_buddy.email()).to(eq("DS9 ext. Defiant"))
    end
  end

  describe("#id") do
    it("identifies contact by that contact's unique place in the list") do
      test_buddy = Contact.new({:name => "Lizzie", :email => "firstpair@gmail.com"})
      test_buddy.save()
      test_buddy2 = Contact.new({:name => "Lee", :email => "secondpair@yahoo.com"})
      test_buddy2.save()
      expect(test_buddy2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds the specific contact by that contact's id") do
      test_buddy = Contact.new({:name => "Lauren", :email => "thirdpair@msn.com"})
      test_buddy.save()
      test_buddy2 = Contact.new({:name => "Kathryn", :email => "fourthpair@gmail.com"})
      test_buddy2.save()
      expect(Contact.find(test_buddy2.id())).to(eq(test_buddy2))
    end
  end

    describe("#add_number") do
    it("adds the phone number to a specific contact") do
      test_buddy = Contact.new({:name => "Barry Potter", :email => "otherpotter@owlmail.com"})
      test_buddy.save()
      test_number = Phone.new({:number => "234 567-8900"})
      test_number.save()
      test_buddy.add_number(test_number)
      expect(test_buddy.numbers()).to(eq([test_number]))
    end
  end

end
