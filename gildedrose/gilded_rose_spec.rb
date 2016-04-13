require 'rspec'
require_relative 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
  
    it ": BUG Input test: The Quality of an item is never more than 50" do
		items = [Item.new("Aged Brie", 10, 55)] 
		GildedRose.new(items).update_quality()		
		expect(items[0].to_s).to eq 'Aged Brie, 9, 55'
	end
  
    it ": Once the sell by date has passed, Quality degrades twice as fast" do
	  items = [Item.new("Elixir of the Mongoose", 0, 10)] 
	  GildedRose.new(items).update_quality()	
	  expect(items[0].to_s).to eq 'Elixir of the Mongoose, -1, 8'
	end

	it ":  the Quality of an item is never negative" do
	  items = [Item.new("Elixir of the Mongoose", 10, 0)] 
	  GildedRose.new(items).update_quality()	
	  expect(items[0].to_s).to eq 'Elixir of the Mongoose, 9, 0'
	end 
	
    it ": Aged Brie actually increases in Quality the older it gets " do
		items = [Item.new("Aged Brie", 10, 10)] 
		GildedRose.new(items).update_quality()		
		expect(items[0].to_s).to eq 'Aged Brie, 9, 11'
	end
  
    it ": The Quality of an item is never more than 50" do
		items = [Item.new("Aged Brie", 10, 50)] 
		GildedRose.new(items).update_quality()		
		expect(items[0].to_s).to eq 'Aged Brie, 9, 50'
	end

	it ": Sulfuras, being a legendary item, never has to be sold or decreases in Quality" do
		items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 10)] 
		GildedRose.new(items).update_quality()		
		expect(items[0].to_s).to eq 'Sulfuras, Hand of Ragnaros, 10, 10'
	end
		
	it ": Backstage passes, increases in Quality as it's SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert" do
		items = [
			Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10),
			Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10),
			Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10),
			Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)
		] 
		GildedRose.new(items).update_quality()		
		expect(items[0].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 10, 11'
		expect(items[1].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 9, 12'		
		expect(items[2].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, 4, 13'
		expect(items[3].to_s).to eq 'Backstage passes to a TAFKAL80ETC concert, -1, 0'		
	end
	
	
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq("foo")
    end
  end
  


end
