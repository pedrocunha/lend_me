require 'lend_me/lender'
require 'csv'

module LendMe
  class Market
    attr_reader :lenders

    def initialize(csv_path)
      @lenders = load_lenders(csv_path)
    end

    private

    def load_lenders(path)
      result = []
      CSV.foreach(path, headers: true) do |row|
        attributes = {
          name: row.fetch("Lender"),
          rate: row.fetch("Rate"),
          amount: row.fetch("Available")
        }
        result << Lender.new(attributes)
      end
      result
    end
  end
end
