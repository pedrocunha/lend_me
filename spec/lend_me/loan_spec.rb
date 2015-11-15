module LendMe
  RSpec.describe Loan do
    let(:market_path) { "spec/fixtures/market.csv" }
    let(:market)      { Market.new(market_path) }
    let(:amount)      { 1000 }

    subject { described_class.new(market, amount) }

    context "when amount is less than 100" do
      let(:amount) { 99 }

      it "throws an error" do
        expect { subject.call }
          .to raise_error(ArgumentError, "Loan amount must be higher or equal than 100.")
      end
    end

    context "when amount is less higher than 15000" do
      let(:amount) { 150001 }

      it "throws an error" do
        expect { subject.call }
          .to raise_error(ArgumentError, "Loan amount must be less or equal than 15000.")
      end
    end

    context "when there are not enough funds" do
      let(:amount) { 4000 }

      it "throws an error" do
        expect { subject.call }
          .to raise_error(ArgumentError, "We're sorry but currently we can't provide a quote for this amount.")
      end
    end

    it "returns the loan attributes" do
      expect(subject.call).to eql({
        monthly_repayment: 30.88,
        total_repayment: 1111.68
      })
    end
  end
end
