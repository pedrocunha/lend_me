module LendMe
  RSpec.describe Lender do
    let(:name)   { "Bob" }
    let(:rate)   { 0.05 }
    let(:amount) { 1000 }

    subject do
      described_class.new(name: name, rate: rate, amount: amount)
    end

    specify { expect(subject.name).to eql("Bob") }
    specify { expect(subject.rate).to eql(0.05) }
    specify { expect(subject.amount).to eql(1000) }
  end
end
