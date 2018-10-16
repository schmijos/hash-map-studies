require_relative '../lib/optimizer_repository.rb'
require_relative '../lib/hash_map.rb'

RSpec.describe OptimizerRepository do
  let(:locator_name) { 'cool hash optimizer' }
  let(:locator) { HashMap.new.default_locator }

  describe '#all' do
    it 'returns all the Optimizers(the OPTIMIZERS array)' do
      expect(described_class.all).to eq([])

      described_class.register(locator_name, locator)

      expect(described_class.all.count).to eq(1)
      expect(described_class.all).to be_a(Array)
    end
  end

  describe '#register' do
    it 'stores a new optimizer' do
      expect { described_class.register(locator_name, locator) }.to change { described_class.all.count }.by(1)
    end
  end
end
