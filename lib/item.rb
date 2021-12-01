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

class AgedBrie < Item

    def update_quality
        @quality += 1
        max_quality
    end

end

class ElixirOfTheMongoose < Item

  def update_quality
      @quality -= 1
      max_quality
  end

end

class Sulfuras < Item

  def update_quality
      max_quality
  end

end

class ConcertTickets < Item

  def update_quality

    @sell_in -= 1

    if @sell_in <= -1
          @quality = 0
        elsif @sell_in <= 5
          @quality += 3
        elsif @sell_in <= 10
          @quality += 2
        else 
          @quality += 1
    end
    max_quality

  end

end
class ConjuredManaCake < Item

  def update_quality

    @quality -= 2
    max_quality

  end

end




