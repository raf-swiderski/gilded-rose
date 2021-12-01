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


  # def update_quality()


  #   @items.each do |item|

  #     def reset_quality(item, amount)
  #       item.quality = amount
  #     end

  #     def increase_quality(item, amount) 
  #       item.quality = item.quality + amount
  #       if item.quality > 50
  #         reset_quality(item, 50)
  #       end
  #       item.sell_in = item.sell_in - 1
  #     end

  #     def decrease_quality(item, amount) 
  #       if item.sell_in < 0  
  #         amount = amount * 2
  #         if item.quality > 0
  #           item.quality = item.quality - amount
  #         end
  #       else 
  #         if item.quality > 0
  #           item.quality = item.quality - amount
  #         end
  #       end
  #       item.sell_in = item.sell_in - 1
  #     end

  #     if item.name == "Aged Brie"
  #       increase_quality(item, 1)
      
  #     elsif item.name == "Elixir of the Mongoose"
  #       decrease_quality(item, 1)

  #     elsif item.name == "Sulfuras, Hand of Ragnaros"
  #       decrease_quality(item, 0)
  #       item.sell_in = nil
      
  #     elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
  #       if item.sell_in == 0
  #         increase_quality(item, 1)
  #         reset_quality(item, 0)
  #       elsif item.sell_in <= 5
  #         increase_quality(item, 3)
  #       elsif item.sell_in <= 10
  #         increase_quality(item, 2)
  #       else 
  #         increase_quality(item, 1)
  #       end
      
  #     elsif item.name == "Conjured Mana Cake"
  #       decrease_quality(item, 2)
  #     else
  #       decrease_quality(item, 1)
  #     end

  #   end 
  # end




