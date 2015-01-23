class ItemsRepo
  attr_reader :data

  def initialize(data, parent)
    items = ItemParser.new(data)
    @data = items.parse
  end

  def all
    data
  end

  def random
    data.sample
  end


end
