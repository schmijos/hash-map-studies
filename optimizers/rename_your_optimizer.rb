your_locator = proc do |_key, collision_count|
  # TODO: your optimizer here
  collision_count
end

OptimizerRepository.register('TODO: fancy name', your_locator)
