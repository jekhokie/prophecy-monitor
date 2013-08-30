require 'spec_helper'

describe Prophecy::Monitor::Instance do
  subject { Prophecy::Monitor::Instance }

  it "can create a new instance" do
    subject.should respond_to(:new)
  end

  describe "attributes" do
    let(:monitor_instance) { FactoryGirl.build :instance }

    it { monitor_instance.should respond_to(:host)       }
    it { monitor_instance.should respond_to(:prism_port) }
  end

  describe "valid?" do
    it "returns true for valid attributes" do
      expect { FactoryGirl.build(:instance) }.to_not raise_error
    end

    # host
    it "raises error for a missing host" do
      expect{ FactoryGirl.build(:instance, :host => "") }.to raise_error
    end

    # prism_port
    it "raises error for a missing prism_port" do
      expect{ FactoryGirl.build(:instance, :prism_port => "") }.to raise_error
    end

    it "returns true for a prism_port of type String" do
      expect{ FactoryGirl.build(:instance, :prism_port => "9999") }.to_not raise_error
    end

    it "raises error for an invalid prism_port of type String" do
      expect{ FactoryGirl.build(:instance, :prism_port => "abc") }.to raise_error
    end

    it "raises error for a prism_port outside of acceptable range 1-65535" do
      expect{ FactoryGirl.build(:instance, :prism_port => 70000) }.to raise_error
    end

    # api_version
    it "returns true for a valid api_version" do
      expect{ FactoryGirl.build(:instance, :api_version => "11") }.to_not raise_error
    end

    it "raises error for an unspecified api_version" do
      expect{ FactoryGirl.build(:instance, :api_version => "") }.to raise_error
    end

    it "raises error for an unsupported api_version" do
      expect{ FactoryGirl.build(:instance, :api_version => "X") }.to raise_error
    end
  end

  describe "api_version" do
    before :each do
      @monitor_instance = FactoryGirl.build :instance
    end

    it "assigns the corresponding API version when the version exists" do
      @monitor_instance.api_version = "11"
      @monitor_instance.api_version.should == "11"
    end

    it "raises error when the version does not exist" do
      expect{ @monitor_instance.api_version=("22") }.to raise_error
    end

    it "retains the previous version when a specified version does not exist" do
      @monitor_instance.stub('api_version=').and_return true

      @monitor_instance.api_version = "22"
      @monitor_instance.api_version.should == "11"
    end
  end

  describe "can_connect?" do
    let(:host)       { "my.host" }
    let(:prism_port) { "9999"    }

    describe "for a non-reachable server" do
      let(:monitor_instance) { FactoryGirl.build :instance }

      it "raises an exception" do
        expect{ monitor_instance.can_connect? }.to raise_error
      end
    end

    describe "for valid connection credentials" do
      let(:monitor_instance) { FactoryGirl.build :instance, :host => host, :prism_port => prism_port }

      before :each do
        FakeWeb.register_uri(:get, "http://#{host}:#{prism_port}/stats_10",
                                   :body => File.open(File.dirname(__FILE__) + "/../fixtures/application_list.xml", "r").read,
                                   :status => [ "200", "OK" ])
      end

      it "returns true" do
        monitor_instance.can_connect?.should be_true
      end
    end
  end
end
