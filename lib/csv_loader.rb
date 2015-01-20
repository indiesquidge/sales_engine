require 'csv'

def load_csv(file)
  CSV.open("../data/#{file}.csv", headers: true, header_converters: :symbol)
end
