class Item
  attr_reader :id, :name, :unit_price

  def initialize(data, parent)
    @id = data[:id].to_i
    @name = data[:name]
    @unit_price = data[:unit_price]
  end


end
