require 'spec_helper'

describe Prophecy::Monitor::Api do
  subject { Prophecy::Monitor::Api }

  it "can create a new instance" do
    subject.should respond_to(:new)
  end

  it "returns an array of supported versions" do
    Prophecy::Monitor::Api.supported_versions.should be_instance_of(Array)
  end

  describe "new" do
    it "returns a new Api instance" do
      Prophecy::Monitor::Api.new("11").should be_instance_of(Prophecy::Monitor::Api::Version11)
    end

    it "raises an error for an unknown version" do
      expect{ Prophecy::Monitor::Api.new("X") }.to raise_error
    end
  end
end
