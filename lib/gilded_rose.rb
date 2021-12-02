require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end


  def update_quality()
    
    @items.each do |item|
      item.update_quality()
    end

  end

end





