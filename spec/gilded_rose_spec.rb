require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do

  # Item class tests
  
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end

    it "never has a negative quality" do
      items = [Item.new("+5 Dexterity Vest", 0, 0)]
      items = [Item.new("+1 Normal Vest", 0, -1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be >= 0
    end

    it "the maximum quality is 50" do
      items = [ConcertTickets.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=9, quality=49)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "tests if items decrease in quality over time by default" do
      item = [Item.new("item", 3, 5)]
      GildedRose.new(item).update_quality()
      expect(item[0].quality).to eq 4
    end

    it "once the sell by date has passed, the item decreases in quality twice as fast" do
      item = [Item.new("item", 0, 5)]
      GildedRose.new(item).update_quality()
      expect(item[0].quality).to eq 3
    end

    it "can update an expired item and a fresh one simulateously" do
      items = [Item.new("Bread", -10, 5), Item.new("Apple", 4, 9)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
      expect(items[1].quality).to eq 8
    end

    # testing classes inherited from Item

    it "tests if aged brie increases in quality" do
      items = [AgedBrie.new("Aged Brie", sell_in=2, quality=0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it "tests if Elixir of the Mongoose decreases in quality" do
      items = [ElixirOfTheMongoose.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6
    end

    it "Sulfuras never increases in quality (1)" do
      items = [Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=1, quality=50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "Sulfuras never decreases in quality (-1)" do
      items = [Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "backstage passes increases in Quality as it’s sell_in value approaches" do
      items = [ConcertTickets.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be > 20
    end

    it "backstage passes quality increases by 2 if the sell_in value is 10 or less" do
      items = [ConcertTickets.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 42
    end

    it "backstage passes quality increases by 3 if the sell_in value is 5 or less (5 days or less until the concert)" do
      items = [ConcertTickets.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=45)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 48
    end
    
    it "Quality drops to 0 after the concert" do
      items = [ConcertTickets.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "`Conjured` items degrade in Quality twice as fast as normal items" do
      items = [ConjuredManaCake.new(name="Conjured Mana Cake", sell_in=3, quality=6)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
    end

  end

end
