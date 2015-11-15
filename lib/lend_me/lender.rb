module LendMe
  class Lender
    attr_reader :name, :rate, :amount

    def initialize(name:, rate:, amount:)
      @name   = name
      @rate   = rate
      @amount = amount
    end
  end
end
