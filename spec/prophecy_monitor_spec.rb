require 'spec_helper'

describe Prophecy::Monitor do
  subject { Prophecy::Monitor }

  it "can create a new instance" do
    subject.should respond_to(:new)
  end

  describe "new" do
    it "returns a new Server instance" do
      Prophecy::Monitor.new(:host => "http://www.google.com/").should be_instance_of(Prophecy::Monitor::Instance)
    end
  end
end
