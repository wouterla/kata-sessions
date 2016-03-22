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
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq -1
    end

    it 'just Aged Brie should increase in quality' do
      items = [Item.new('Aged Brie', 0, 48)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq -1
    end

    it 'Aged Brie with 49 quality should not exceed 50' do
      items = [Item.new('Aged Brie', 0, 49)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq -1
    end

    it 'Sulfuras should not change in quality and sellin' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq("Sulfuras, Hand of Ragnaros")
      expect(items[0].quality).to eq 10
      expect(items[0].sell_in).to eq 0
    end

    it 'Backstage passes should be increase in quality in 1 when 11 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 1 
      expect(items[0].sell_in).to eq 10
    end

    it 'Backstage passes should be increase in quality in 2 when 10 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2 
      expect(items[0].sell_in).to eq 9
    end

    it 'Backstage passes should be increase in quality in 2 when 6 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 0)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2 
      expect(items[0].sell_in).to eq 5
    end

    it 'Backstage passes should be increase in quality in 3 when 5 days left' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 3)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 6 
      expect(items[0].sell_in).to eq 4
    end

    it 'Backstage passes should be increase in quality in 3 on the day of the concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 20)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 23 
      expect(items[0].sell_in).to eq 0
    end

    it 'Backstage passes should have quality 0 when 1 day after concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, -1)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0 
      expect(items[0].sell_in).to eq -1
    end

    it 'Backstage should have a maximum of 50 quality 20 days before the concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 49)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50 
      expect(items[0].sell_in).to eq 19
    end

    it 'Backstage should have a maximum of 50 quality 6 days before the concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 49)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50 
      expect(items[0].sell_in).to eq 5
    end

    it 'Backstage should have a maximum of 50 quality 1 days before the concert adding only 1' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 49)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50 
      expect(items[0].sell_in).to eq 0
    end

    it 'Backstage should have a maximum of 50 quality 1 days before the concert adding only 2' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 48)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50 
      expect(items[0].sell_in).to eq 0
    end

    it 'Backstage should have a maximum of 50 quality 1 days before the concert adding 3' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 47)] 
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50 
      expect(items[0].sell_in).to eq 0
    end

  end
end
