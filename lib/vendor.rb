class Vendor

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end


  def check_stock(item)
    @inventory.values.count
  end

end
