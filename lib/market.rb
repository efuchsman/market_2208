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
end
