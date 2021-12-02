class Item
    attr_accessor :name, :sell_in, :quality
  
    def initialize(name, sell_in, quality)
      @name = name
      @sell_in = sell_in
      @quality = quality
    end
  
    def to_s()
      "#{@name}, #{@sell_in}, #{@quality}"
    end

    def update_quality()
      
      @sell_in -= 1
      if @sell_in > 0 
        @quality -= 1
      else
        @quality -= 2
      end
      
      @quality = 0 if @quality < 0

    end

    def max_quality
      @quality = 50 if @quality > 50
    end
end

require_relative 'inherited_items/aged_brie' 
require_relative 'inherited_items/exilir_of_the_mongoose'
require_relative 'inherited_items/sulfuras'
require_relative 'inherited_items/concert_tickets'
require_relative 'inherited_items/conjured_mana_cake'












