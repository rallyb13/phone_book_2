class Phone
  @@phones = []
  attr_reader(:number, :type)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @type = attributes[:type]
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_method(:save) do
    @@phones.push(self)
  end

  define_singleton_method(:clear) do
    @@phones = []
  end
end
