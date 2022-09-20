class Vendor

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end


  def check_stock(item)
    if @inventory[item]
      return @inventory[item]
    else
      0
    end
  end

  def stock(item, amount)
    if @inventory[item]
      @inventory[item] += amount
    else
      @inventory[item] = amount
    end
  end

  def potential_revenue
    pot_rev = @inventory.map do |item, amount|
      item.price * amount
    end
    pot_rev.sum
  end

end
