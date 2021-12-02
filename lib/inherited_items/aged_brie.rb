class AgedBrie < Item

    def update_quality
        @quality += 1
        max_quality
    end

end