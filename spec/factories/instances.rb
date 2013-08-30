FactoryGirl.define do
  factory :instance, :class => "Prophecy::Monitor::Instance" do
    host        "my.host"
    prism_port  9999
    api_version "11"

    initialize_with {
      new(:host => host, :prism_port => prism_port, :opts => { :api_version => api_version })
    }
  end
end
