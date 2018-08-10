KeyValuePair = Struct.new(:key, :value)

class HashMap
  attr_reader :collision_count

  def initialize
    @storage = []
    @hasher = lambda { |key| key.length }
    @collision_count = 0
  end

  def retrieve(key)
    @storage[find_index(key)]&.value
  end
  alias [] retrieve

  def put(key, value)
    @storage[find_index(key)] = KeyValuePair.new(key, value)
  end
  alias []= put

  private

  def find_index(key)
    index = @hasher.call(key)

    until free_position?(index) ^ found?(index, key)
      @collision_count += 1
      index = @hasher.call(key)
    end

    index
  end

  def found?(index, key)
    @storage[index]&.key == key
  end

  def free_position?(index)
    @storage[index].nil?
  end
end
