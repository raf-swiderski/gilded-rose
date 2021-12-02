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