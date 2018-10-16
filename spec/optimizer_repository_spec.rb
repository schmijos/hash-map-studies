require_relative '../lib/optimizer_repository.rb'
require_relative '../lib/hash_map.rb'

RSpec.describe OptimizerRepository do
  let(:locator_name) { 'cool hash optimizer' }
  let(:locator) { HashMap.new.default_locator }

  describe '#all' do
    it 'returns all the Optimizers(the OPTIMIZERS array)' do
      expect(OptimizerRepository.all).to eq([])

      OptimizerRepository.register(locator_name, locator)

      expect(OptimizerRepository.all.count).to eq(1)
      expect(OptimizerRepository.all).to be_a(Array)
    end
  end

  describe '#register' do
    it 'stores a new optimizer' do
      expect { OptimizerRepository.register(locator_name, locator) }.to change { OptimizerRepository.all.count }.by(1)
    end
  end
end
