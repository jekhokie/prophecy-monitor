require 'spec_helper'

describe Prophecy::Monitor::Api::Version11 do
  context "url response methods" do
    describe "connect_path" do
      it "returns the connect_path for Prophecy Monitor" do
        FactoryGirl.build(:api, :version => "11").connect_path.should be_instance_of(String)
      end
    end

    describe "application_ids_sessions_path" do
      it "returns the connect_path for Prophecy Monitor" do
        FactoryGirl.build(:api, :version => "11").connect_path.should be_instance_of(String)
      end
    end
  end

  context "processing methods" do
    describe "connect_response_valid?" do
      let(:api) { FactoryGirl.build :api, :version => "11" }

      it "returns true for a valid response HTTP code" do
        api.connect_response_valid?("200").should == true
      end

      it "returns false for an non-OK response HTTP code" do
        api.connect_response_valid?("abc").should == false
      end
    end
  end
end
