class MerchantRepo
  def initialize(merchants)
    @merchants = merchants
  end

  def all
    @merchants
  end

  def random
    @merchants.sample
  end

  def find_by_id(id)
    @merchants.find { |merchant| merchant.id == id }
  end

  def find_by_name(name)
    @merchants.find { |merchant| merchant.name == name }
  end

  def find_by_time_created(time)
    @merchants.find { |merchant| merchant.created_at == time }
  end

  def find_by_time_updated(time)
    @merchants.find { |merchant| merchant.updated_at == time }
  end

  def find_all_by_name(name)
    @merchants.select { |merchant| merchant.name == name }
  end

  def find_all_by_time_created(time)
    @merchants.select { |merchant| merchant.created_at == time }
  end

  def find_all_by_time_updated(time)
    @merchants.select { |merchant| merchant.updated_at == time }
  end
end
