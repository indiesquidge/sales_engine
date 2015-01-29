require_relative 'customer_repo'
require_relative 'merchant_repo'
require_relative 'transaction_repo'
require_relative 'invoice_items_repo'
require_relative 'items_repo'
require_relative 'invoice_repo'

require_relative 'parser'
require_relative 'customer'
require_relative 'merchant'
require_relative 'transaction'
require_relative 'invoice_item'
require_relative 'item'
require_relative 'invoice'

class SalesEngine
  attr_reader :customer_repository, :merchant_repository, :invoice_repository,
              :invoice_item_repository, :item_repository, :transaction_repository
  attr_reader :customers, :merchants, :invoices,
              :invoice_items, :items, :transactions

  def initialize(filepath="../data")
    @customers = Parser.parse("#{filepath}/customers.csv", Customer)
    @merchants = Parser.parse("#{filepath}/merchants.csv", Merchant)
    @transactions = Parser.parse("#{filepath}/transactions.csv", Transaction)
    @invoice_items = Parser.parse("#{filepath}/invoice_items.csv", InvoiceItem)
    @items = Parser.parse("#{filepath}/items.csv", Item)
    @invoices = Parser.parse("#{filepath}/invoices.csv", Invoice)
  end

  def startup
    @customer_repository = CustomerRepo.get_instance(customers)
    @merchant_repository = MerchantRepo.get_instance(merchants)
    @transaction_repository = TransactionRepo.get_instance(transactions)
    @invoice_item_repository = InvoiceItemsRepo.get_instance(invoice_items)
    @item_repository = ItemsRepo.get_instance(items)
    @invoice_repository = InvoiceRepo.get_instance(invoices)
  end
end
