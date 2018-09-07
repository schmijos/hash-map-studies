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

  describe '#with_locator' do
    it 'has a fluent interface' do
      expect(hash_map.with_locator(&-> {})).to eq(hash_map)
    end
  end

  describe '#fill_level' do
    it 'initially returns NaN' do
      expect(hash_map.fill_level).to be_nan
    end

    it 'returns 1 if storage is full' do
      hash_map.put('lionel', double)
      expect(hash_map.fill_level).to eq(1)
    end

    context 'when we\'re using another locator' do
      let(:key_length_hash_map) { hash_map.with_locator { |key, collision_count| key.length + collision_count } }

      it 'behaves accordingly' do
        key_length_hash_map.put('lionel', double)
        expect(key_length_hash_map.fill_level).to eq(1.0 / 7.0)

        key_length_hash_map.put('abc', double)
        expect(key_length_hash_map.fill_level).to eq(2.0 / 7.0)

        key_length_hash_map.put('spiderman', double)
        expect(key_length_hash_map.fill_level).to eq(3.0 / 10.0)

        key_length_hash_map.put('flachglas', double)
        expect(key_length_hash_map.fill_level).to eq(4.0 / 11.0)
      end
    end
  end
end
