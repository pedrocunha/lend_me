module LendMe
  RSpec.describe Lender do
    let(:name)     { "Bob" }
    let(:interest) { 5 }
    let(:amount)   { 1000 }

    subject do
      described_class.new(name: name, interest: interest, amount: amount)
    end

    specify { expect(subject.name).to eql("Bob") }
    specify { expect(subject.interest).to eql(5) }
    specify { expect(subject.amount).to eql(1000) }
  end
end
