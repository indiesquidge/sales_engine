class MerchantRepo
  attr_reader :merchants

  def initialize(merchants)
    @merchants = merchants
  end

  def self.get_instance(merchants=nil)
    @merchant_repo ||= new(merchants)
  end

  def self.clear
    @merchant_repo = nil
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(id)
    find_by_attribute(:id, id)
  end

  def find_by_name(name)
    find_by_attribute(:name, name)
  end

  def find_by_time_created(time)
    find_by_attribute(:created_at, time)
  end

  def find_by_time_updated(time)
    find_by_attribute(:updated_at, time)
  end

  def find_all_by_name(name)
    find_all_by_attribute(:name, name)
  end

  def find_all_by_time_created(time)
    find_all_by_attribute(:created_at, time)
  end

  def find_all_by_time_updated(time)
    # find_all_by_attribute(:updated_at, time)
    merchants.select { |merchant| Date.parse(merchant.updated_at) == Date.parse(time) }
  end

  def revenue(date=nil)
    merchants.inject(0) { |total, merchant| total += merchant.revenue(date) }
  end

  private

  def find_by_attribute(attr, criteria)
    merchants.find { |merchant| merchant.send(attr.to_sym) == criteria }
  end

  def find_all_by_attribute(attr, criteria)
    merchants.select { |merchant| merchant.send(attr.to_sym) == criteria }
  end
end
