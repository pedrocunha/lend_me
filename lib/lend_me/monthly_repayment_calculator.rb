class MonthlyRepaymentCalculator
  NUMBER_OF_PAYMENTS = 36

  def initialize(rate:, amount:, number_of_payments: NUMBER_OF_PAYMENTS)
    @rate               = rate
    @amount             = amount
    @number_of_payments = number_of_payments
  end

  def call
    @result ||= compute.round(4)
  end

  private

  def periodic_interest_rate
    @periodic_interest_rate ||= @rate/12
  end

  # Formula taken from:
  # https://en.wikipedia.org/wiki/Amortization_calculator
  def compute
    principal = @amount
    i         = periodic_interest_rate
    n         = @number_of_payments

    principal * (i + i/((1+i)**n - 1))
  end
end
