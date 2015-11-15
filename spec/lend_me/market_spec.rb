module LendMe
  RSpec.describe Market do
    let(:path) { "spec/fixtures/market.csv" }
    subject    { described_class.new(path) }

    it "loads 7 lenders" do
      expect(subject.lenders.size).to eql(7)
    end
  end
end

