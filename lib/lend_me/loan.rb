class Loan
  def initialize(market, amount)
    @market = market
    @amount = amount
  end

  def call
    check_if_valid_amount!
    check_if_enough_funds!

    amount_to_borrow = @amount
    repayments       = [];

    @market.lenders.each do |lender|
      if lender.amount > amount_to_borrow
        value = amount_to_borrow
      else
        value = lender.amount
      end

      repayments << MonthlyRepaymentCalculator.new(rate: lender.rate, amount: value).call
      amount_to_borrow -= value
      break if amount_to_borrow == 0
    end

    {
      monthly_repayment: monthly_repayment(repayments),
      total_repayment: total_repayment(repayments)
    }
  end

  private

  def check_if_valid_amount!
    if @amount < 100
      raise ArgumentError.new("Loan amount must be higher or equal than 100.")
    elsif @amount % 100 != 0
      raise ArgumentError.new("Loan amount must be a multiple of 100.")
    elsif @amount > 15000
      raise ArgumentError.new("Loan amount must be less or equal than 15000.")
    end
  end

  def check_if_enough_funds!
    if @market.funds < @amount
      raise ArgumentError.new("We're sorry but currently we can't provide a quote for this amount.")
    end
  end

  def monthly_repayment(repayments)
    @monthly_repayment ||= repayments.inject(&:+).round(2)
  end

  def total_repayment(repayments)
    @total_repayment ||= (monthly_repayment(repayments) * MonthlyRepaymentCalculator::NUMBER_OF_PAYMENTS).round(2)
  end
end
