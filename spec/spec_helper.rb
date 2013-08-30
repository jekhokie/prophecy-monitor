# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

# Simplecov test coverage tool
require 'simplecov'
SimpleCov.start

# Include the Fakeweb web mock framework
require 'fakeweb'

require 'factory_girl'
require_relative '../lib/prophecy-monitor'

# Auto-discover Factories
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true

  # Configure for FactoryGirl usage
  config.include FactoryGirl::Syntax::Methods

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
