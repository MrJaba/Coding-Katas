require 'catalogue'
require 'trolley'

class CheckOut
  
  def initialize( catalogue )
    @catalogue = catalogue
  end
  
  def scan( item )    
    trolley.add( item )
  end
  
  def trolley
    @trolley ||= Trolley.new( @catalogue )
  end
  
  def total
    trolley.items.inject(0){ |sum, item| sum + item.price }
  end
  
end