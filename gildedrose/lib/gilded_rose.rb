class GildedRose

  def initialize(items)
    @items = items
  end

  def decrease_quality(item)
    if item.quality > 0
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.quality = item.quality - 1
      end
    end
  end

  def backstagepass_increase_quality(item)
    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      if item.sell_in < 10
        general_increase_quality(item)
      end
      if item.sell_in < 5
        general_increase_quality(item)
      end
    end
  end

  def general_increase_quality(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
  end

  def increase_quality(item)
    general_increase_quality(item)
    backstagepass_increase_quality(item)

    if item.name == "Aged Brie" && item.quality < 50 && item.sell_in < 0
      item.quality = item.quality + 1
    end
  end

def update_individual_item_quality(item)
  if item.name != "Sulfuras, Hand of Ragnaros"
    item.sell_in = item.sell_in - 1
  end

  if item.name == "Aged Brie" or item.name == "Backstage passes to a TAFKAL80ETC concert"
    increase_quality(item)
  else
    decrease_quality(item)
  end


  if item.sell_in < 0
    if item.name != "Aged Brie" &&  item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros" && item.quality > 0
      item.quality = item.quality - 1
    end

    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      item.quality = 0
    end

  end
end

  def update_quality()
    @items.each do |item|
      update_individual_item_quality(item)
    end
  end
end

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
end
