class ItemsRepo
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def self.get_instance(items=nil)
    @items_repo ||= new(items)
  end

  def self.clear
    @items_repo = nil
  end

  def all
    @items
  end

  def random
    @items.sample
  end

  def find_by_name(name)
    find_by_attribute(:name, name)
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_unit_price(unit_price)
    find_by_attribute(:unit_price, unit_price)
  end

  def find_by_time_created(created_at)
    find_by_attribute(:created_at, created_at)
  end

  def find_by_time_updated(updated_at)
    find_by_attribute(:updated_at, updated_at)
  end

  def find_by_merchant_id(merchant_id)
    find_by_attribute(:merchant_id, merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_attribute(:merchant_id, merchant_id)
  end

  def find_all_by_time_created(created_at)
    find_all_by_attribute(:created_at, created_at)
  end

  def find_all_by_time_updated(updated_at)
    find_all_by_attribute(:updated_at, updated_at)
  end

  private

  def find_by_attribute(attribute,criteria)
    @items.detect {|x| x.send(attribute.to_sym)  == criteria}
  end

  def find_all_by_attribute(attribute,criteria)
    @items.select {|x| x.send(attribute.to_sym) == criteria}
  end


end
