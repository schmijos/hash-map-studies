KeyValuePair = Struct.new(:key, :value)

class HashMap
  attr_reader :total_collision_count

  def initialize
    @storage = []
    @locator = lambda { |_key, collision_count| collision_count } # default locator
    @total_collision_count = 0
  end

  def default_locator
    lambda { |_key, collision_count| collision_count }
  end

  def with_locator(&locator)
    @locator = locator
    self
  end

  def retrieve(key)
    @storage[find_index(key)]&.value
  end
  alias [] retrieve

  def put(key, value)
    @storage[find_index(key)] = KeyValuePair.new(key, value)
  end
  alias []= put

  def fill_level
    @storage.count { |item| !item.nil? }.to_f / @storage.length
  end

  private

  def find_index(key)
    collision_count = 0
    index = @locator.call(key, collision_count)

    until free_position?(index) ^ found?(index, key)
      collision_count += 1
      index = @locator.call(key, collision_count)
    end

    @total_collision_count += collision_count
    index
  end

  def found?(index, key)
    @storage[index]&.key == key
  end

  def free_position?(index)
    @storage[index].nil?
  end
end
