require("rspec")
require("contact")
require("phone")

describe("Phone") do
  before do
    Phone.clear()
  end

  describe(".all") do
    it("starts without anything in it") do
      test_number = Phone.new({:number => "111 111-2222"})
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a set of phone numbers, together, in the larger phone number list") do
      test_number = Phone.new({:number => "111 111-2222"})
      test_number.save()
      expect(Phone.all()).to(eq([test_number]))
    end
  end

  describe(".clear") do
    it("empties the phone list of all saved content") do
      test_number = Phone.new({:number => "111 111-2222"})
      test_number.save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#number") do
    it("returns phone number") do
      test_number = Phone.new({:number => "111 111-2222"})
      test_number.save()
      expect(test_number.number).to(eq("111 111-2222"))
    end
  end

  describe("#type") do
    it("returns the classification for the phone number (cell/home/work)") do
      test_number = Phone.new({:number => "323 434-5656", :type => "home"})
      test_number.save()
      expect(test_number.type()).to(eq("home"))
    end
  end

end