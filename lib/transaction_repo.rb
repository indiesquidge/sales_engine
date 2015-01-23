require_relative 'transaction'

class TransactionRepo
  attr_reader :entries

  def initialize(data, engine)

  end

  def create_entries(entries)
    entries.collect {|entry| Transaction.new(entry, self)}
  end

end
