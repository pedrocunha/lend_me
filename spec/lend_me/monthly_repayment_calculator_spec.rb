module LendMe
  RSpec.describe MonthlyRepaymentCalculator do
    let(:rate)   { 0.069 }
    let(:amount) { 480 }

    subject { described_class.new(rate: rate, amount: amount) }

    it "returns the monthly repayment for the next 36 months" do
      expect(subject.call).to eql(14.8)
    end
  end
end
