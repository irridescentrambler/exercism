require 'pry-byebug'
Item = Struct.new(:name, :sell_in, :quality)

class GildedRose
  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
  CONJURED_AGED_BRIE = "Conjured Aged Brie"
  CONJURED_BACKSTAGE_PASSES = "Conjured backstage passes to a TAFKAL80ETC concert"
  CONJURED_RABBIT = "Conjured Rabbit"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def initialize(items)
    @items = items
  end

  def update!
    @items.each do |item|
      update_quality_before_sell_in(item)
      decrease_sell_in(item)
      update_quality_after_sell_in(item)
    end
  end

  private

  def update_quality_before_sell_in(item)
    if normal_item?(item)
      decrease_quality_for_normal(item)
    else
      increase_quality_for_special(item)
    end
  end

  def decrease_quality_for_normal(item)
    if conjured_rabbit?(item) && item.quality > 0
      item.quality -= 1
    end
    if !sulfuras?(item) && item.quality > 0
      item.quality -= 1
    end
  end

  def increase_quality_for_special(item)
    return unless item.quality < 50

    item.quality += 1
    return unless backstage_passes?(item)

    if item.sell_in < 11 && item.quality < 50
      item.quality += 1
    end
    if item.sell_in < 6 && item.quality < 50
      item.quality += 1
    end
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless sulfuras?(item)
  end

  def update_quality_after_sell_in(item)
    return unless item.sell_in < 0

    if !aged_brie?(item)
      if normal_item_after_expiry?(item)
        if item.quality > 0
          if conjured_rabbit?(item)
            item.quality -= 7
          end
          if conjured_aged_brie?(item)
            item.quality -= 10
          end
          if !sulfuras?(item)
            item.quality -= 1
          end
        end
      else
        item.quality = 0
      end
    else
      if item.quality < 50
        item.quality += 1
      end
    end
  end

  def normal_item?(item)
    ![AGED_BRIE, BACKSTAGE_PASSES, CONJURED_AGED_BRIE, CONJURED_BACKSTAGE_PASSES].include?(item.name)
  end

  def normal_item_after_expiry?(item)
    ![BACKSTAGE_PASSES, CONJURED_AGED_BRIE, CONJURED_BACKSTAGE_PASSES].include?(item.name)
  end

  def aged_brie?(item)
    item.name == AGED_BRIE
  end

  def backstage_passes?(item)
    item.name == BACKSTAGE_PASSES
  end

  def conjured_aged_brie?(item)
    item.name == CONJURED_AGED_BRIE
  end

  def conjured_rabbit?(item)
    item.name == CONJURED_RABBIT
  end

  def sulfuras?(item)
    item.name == SULFURAS
  end
end
