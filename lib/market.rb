

class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
   @vendors.map(&:name)
  end

  def vendors_that_sell(item)
    match_array = @vendors.reject do |vendor|
      vendor.inventory.keys.include?(item) == false
    end
    match_array
  end

  def total_inventory
    entire_inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
           if entire_inventory[item]
          entire_inventory[item][:quantity] += amount
           else
            entire_inventory[item] = {quantity: vendor.inventory[item], vendors: vendors_that_sell(item)}
           end
      end
    end
   entire_inventory
  end

  def overstocked_items
    overstocked = []
    total_inventory.each do |item, details|
      overstocked << item if details[:quantity] > 50 && details[:vendors].count >= 2
    end
    p overstocked
  end

  def sorted_item_list
   total_inventory.keys.map do |item|
    item.name
   end.sort
  end

  def date
    Date.today.strftime("%d/%m/%Y")
  end

  def sell(item, quantity)
    return false if sorted_item_list.none?(item.name)
    return false if  total_inventory[item][:quantity] < quantity

    total_inventory[item][:vendors].each do |vendor|
      if vendor.inventory[item] < quantity
        quantity -= vendor.inventory[item]
        vendor.inventory[item] = 0
      else
        vendor.inventory[item] -= quantity
        break
      end
    end
    true
  end
end
