your_locator = proc do |key, collision_count|
  # TODO: your optimizer here, e.g.:
  key.length + collision_count
end

OptimizerRepository.register('TODO: fancy name', your_locator)
