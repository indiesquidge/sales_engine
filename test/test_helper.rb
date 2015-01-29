require 'simplecov'
SimpleCov.start 'rails' do
    require 'simplecov-badge'
    # add your normal SimpleCov configs
    add_filter "/app/admin/"
    # configure any options you want for SimpleCov::Formatter::BadgeFormatter
    SimpleCov::Formatter::BadgeFormatter.badge_title = 'coverage'
    SimpleCov::Formatter::BadgeFormatter.generate_groups = false
    SimpleCov::Formatter::BadgeFormatter.strength_foreground = false
    SimpleCov::Formatter::BadgeFormatter.timestamp = true
    # call SimpleCov::Formatter::BadgeFormatter after the normal HTMLFormatter
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
        SimpleCov::Formatter::HTMLFormatter,
        SimpleCov::Formatter::BadgeFormatter,
    ]
end

require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'pry'
require 'bigdecimal'

Dir.glob("./lib/*.rb").each { |filename| require filename }
