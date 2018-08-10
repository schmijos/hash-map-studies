require_relative '../lib/hash_map.rb'

RSpec.describe HashMap do
  let(:hash_map) { described_class.new }
  let(:key) { '1337' }
  let(:value) { double('some object') }

  describe '#new' do
    it 'initializes' do
      expect(hash_map).not_to be_nil
    end
  end

  describe '#retrieve' do
    subject { hash_map.retrieve(key) }

    context 'when the key is not present' do
      it { is_expected.to be_nil }
    end

    context 'when the key is present' do
      before { hash_map.put(key, value) }

      it { is_expected.to be(value) }
    end
  end

  describe '#put' do
    subject { hash_map.put(key, value) }

    it { will_be_expected.to change { hash_map.retrieve(key) }.from(nil).to(value) }
  end
end
