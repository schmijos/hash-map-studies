require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

module WillBeExpected
  def will_be_expected
    expect { subject }
  end
end

RSpec.configure do |config|
  config.default_formatter = 'doc' if config.files_to_run.one?

  config.order = :random
  Kernel.srand config.seed

  config.include WillBeExpected
end
