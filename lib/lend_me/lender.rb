module LendMe
  class Lender
    attr_reader :name, :interest, :amount

    def initialize(name:, interest:, amount:)
      @name     = name
      @interest = interest
      @amount   = amount
    end
  end
end
