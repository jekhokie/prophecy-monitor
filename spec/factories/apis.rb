FactoryGirl.define do
  factory :api, :class => "Prophecy::Monitor::Api" do
    version "11"

    initialize_with { new(version) }
  end
end
