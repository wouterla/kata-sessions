require 'rspec'
require 'spec_helper'
require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it 'an item "foo" can be updated' do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq("foo")
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq -1
    end

    it 'quality degrades twice as fast for a normal item past its sell by date' do
      items = [Item.new("foo", -5, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq("foo")
      expect(items[0].quality).to eq 18
      expect(items[0].sell_in).to eq -6
    end

    it 'Aged Brie should increase in quality with age' do
      items = [Item.new('Aged Brie', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq("Aged Brie")
      expect(items[0].quality).to eq 2
      expect(items[0].sell_in).to eq -1
    end

    it 'Very Aged Brie should not increase in quality over 50' do
      items = [Item.new('Aged Brie', 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq("Aged Brie")
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq -1
    end

    it 'just Aged Brie should increase in quality' do
      items = [Item.new('Aged Brie', 0, 48)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq("Aged Brie")
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq -1
    end

    it 'Sulfuras should ont change in quality and sellin' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq("Sulfuras, Hand of Ragnaros")
      expect(items[0].quality).to eq 10
      expect(items[0].sell_in).to eq 0
    end

    it 'Backstage passes should be increase in quality in 2 when 10 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2 
      expect(items[0].sell_in).to eq 9
    end
    it 'Backstage passes should be increase in quality in 3 when 5 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 3)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 6 
      expect(items[0].sell_in).to eq 4
    end
    it 'Backstage passes should be increase in quality in 0 when 1 day after concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, -1)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0 
      expect(items[0].sell_in).to eq -1
    end


  end

end
