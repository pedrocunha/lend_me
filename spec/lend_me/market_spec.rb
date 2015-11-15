module LendMe
  RSpec.describe Market do
    let(:path) { "spec/fixtures/market.csv" }
    subject    { described_class.new(path) }

    it "loads 7 lenders" do
      expect(subject.lenders.size).to eql(7)
    end

    describe "#funds" do
      it "returns the total amount of funds" do
        expect(subject.funds).to eql(2330)
      end
    end
  end
end

