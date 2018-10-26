# The following callable gets two parameters:
# - a string `key` which addresses the entry
# - an integer `collision_count` which tells you how often the index you returned
#   for this key pointed to an already occupied storage field
# It should return an integer which tells the calling code where to find the element belonging to this key.
your_locator = proc do |key, collision_count|
  # TODO: your optimizer comes here.
  key.length + collision_count
end

# Here you register your locator globally here so that it can be called by bin/run
OptimizerRepository.register('TODO: fancy name', your_locator)
