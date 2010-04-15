class Item
  attr_accessor :name, :price, :special_offer
  def initialize( name, price, special_offer=false )
    self.name, self.price, self.special_offer = name, price, special_offer
    @regex = form_regex
  end
  
  def match(items)
    @regex =~ items
  end
  
  def components
    name.split(//)
  end
  
  def special_offer?
    self.special_offer
  end
  
private

  def form_regex
    Regexp.new(self.name.split(//).join("[A-Z]*"))
  end
  
end