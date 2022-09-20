

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
    v_names = @vendors.map do |vendor|
      vendor.name
    end
    v_names
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
      overstocked << item if details[:quantity] > 50
    end
    p overstocked
  end

end
