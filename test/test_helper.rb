require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'pry'
require 'bigdecimal'

Dir.glob("./lib/*.rb").each { |filename| require filename }
