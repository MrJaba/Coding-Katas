require 'item'
class Catalogue
  
  def initialize( raw_catalogue )
    @raw_catalogue = raw_catalogue   
  end
  
  def lookup( raw_item, previous_items=[] )
    @items, @specials = parse_items_and_specials( @raw_catalogue ) unless @items
    tmp = (previous_items << raw_item).join("")
    @specials.select{ |special_item| special_item.match( tmp ) }.first || @items[raw_item]
  end
  
private

  def parse_items_and_specials( raw_catalogue )
    items, specials = {}, []
    raw_catalogue.strip.split("\n").each do |item|
      details = item.strip.split(/\s{4,5}/)
      item_name, item_price = details[0] , details[1].to_i      
      special_offer = details[2].strip unless details[2].nil?      
      items[item_name] = Item.new( item_name, item_price )
      if special_offer
        qty, price = special_offer.split(/for/).map{|a| a.to_i }
        specials << Item.new(item_name*qty, price, :special_offer)
      end
    end
    return items, specials
  end
  
end