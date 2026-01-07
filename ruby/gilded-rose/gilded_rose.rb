require 'pry-byebug'
Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Conjured Aged Brie" && item.name != "Conjured backstage passes to a TAFKAL80ETC concert" 
        if item.name == "Conjured Rabbit" && item.quality > 0
          item.quality -= 1
        end
        if item.name != "Sulfuras, Hand of Ragnaros" && item.quality > 0
          item.quality -= 1
        end
      else
        if item.quality < 50
          item.quality += 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality += 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality += 1
              end
            end
          end
        end
      end

      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Conjured Aged Brie" && item.name != "Conjured backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name == "Conjured Rabbit"
                item.quality -= 7
              end
              if item.name == "Conjured Aged Brie"
                item.quality -= 10
              end
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality -= 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality += 1
          end
        end
      end
    end
  end
end
