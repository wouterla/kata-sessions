class GildedRose

  def initialize(items)
    @items = items
  end

  def extra_update_quality_when_backstage_pass(item)
  	if backstagepass?(item)
		if item.sell_in < 11	  
			item.quality = item.quality + 1
		end
		if item.sell_in < 6
			item.quality = item.quality + 1
		end
	  end
  end
  
  def update_quality_when_sellin_less_than_zero(item)
	if agedbrie?(item)
	   increase_quality(item)
	else
	 if backstagepass?(item)
		item.quality = 0
	  else
		decrease_quality(item)
	  end
	end
  end
 
  def decrease_quality(item)
	if item.quality > 0
		if !sulfuras?(item)
			item.quality = item.quality - 1
		end
	end
  end
  
  def increase_quality(item)
    if item.quality < 50
    	item.quality = item.quality + 1
		extra_update_quality_when_backstage_pass(item)
	end	
  end
  
  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end
  def backstagepass?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end
  def agedbrie?(item)
    item.name == "Aged Brie"
  end
  
  def update_quality()
    @items.each do |item|
      if agedbrie?(item) or backstagepass?(item)
        increase_quality(item)
      else
		decrease_quality(item)
      end
      if !sulfuras?(item)
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        update_quality_when_sellin_less_than_zero(item)
      end
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