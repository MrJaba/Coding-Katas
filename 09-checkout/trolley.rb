class Trolley
  
  def initialize( catalogue )
    @raw_catalogue = catalogue
  end
  
  def add(raw_item)
    @items ||= []
    item = catalogue.lookup( raw_item, contents )
    remove_items( item ) if item.special_offer?
    @items << item
  end
  
  def items
    @items || []
  end
  
  def catalogue
    @catalogue ||= Catalogue.new( @raw_catalogue )
  end
  
private

  def contents
    @items.select{|i| !i.special_offer? }.collect{ |item| item.name }
  end
  
  def remove_items( item )    
    item.components.each do |item_to_remove|
      index = @items.index( catalogue.lookup( item_to_remove ) )
      @items.delete_at( index ) if index
    end
  end
  
end