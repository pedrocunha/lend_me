require 'lend_me/lender'
require 'csv'

module LendMe
  class Market
    attr_reader :lenders

    def initialize(csv_path)
      @lenders = load_lenders(csv_path)
    end

    def funds
      @lenders.map(&:amount).inject(:+)
    end

    private

    # Make sure lenders are sorted out by
    # best favourable rates for loans
    def load_lenders(path)
      result = []

      CSV.foreach(path, headers: true) do |row|
        attributes = {
          name:   row.fetch("Lender"),
          rate:   row.fetch("Rate").to_f,
          amount: row.fetch("Available").to_f
        }
        result << Lender.new(attributes)
      end

      result.sort_by do |lender|
        [lender.rate, -1 * lender.amount]
      end
    end
  end
end
