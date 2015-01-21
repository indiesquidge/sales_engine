require 'csv'

class CSVLoader

def self.load_csv(file)
  CSV.open("../data/#{file}.csv", headers: true, header_converters: :symbol)
end

end
