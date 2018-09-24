require_relative '../lib/optimizer_repository.rb'

RSpec.describe OptimizerRepository do
  let(:name) { 'cool hash optimizer' }
  let(:locator) { proc { |_key, collision_count| collision_count } }
  let(:optimizer) { Struct.new(:name, :locator) }
  let(:optimizerRepo) { described_class }
  let(:optimizers) { optimizerRepo.all }

  describe '::all' do
    context 'when optimizers is empty' do
      it 'returns all the Optimizers(the OPTIMIZERS array)' do
        expect(optimizerRepo.all.count).to eq(optimizers.count)
      end
    end
    context 'when optimizers is not empty' do
      it 'returns all the Optimizers(the OPTIMIZERS array)' do
        optimizerRepo.register(name, locator)
        expect(optimizerRepo.all.count).to eq(optimizers.count)
      end
    end
  end

  describe '::register' do
    it 'registers a new optimizer' do
      expect { optimizerRepo.register(name, locator) }.to change { optimizers.count }.by(1)
    end
  end
end
