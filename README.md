# Prophecy::Monitor

Interface to the Voxeo Prophecy software.

## Background

In an effort to track the current call status of different applications in a Voxeo Prophecy
instance, this project allows for interfacing with a Voxeo Prophecy instance in order to present
current call counts based on application ID mappings, along with other information exposed via
the Prophecy API.

## Supported Voxeo Prophecy Versions

This application has been tested on/works with version 11 of Voxeo Prophecy.

## Installation

### Voxeo Prophecy:

Reference the Voxeo Prophecy installation instructions for your particular Prophecy instance:

  http://voxeo.com/products/voxeo-prophecy/

### prophecy-monitor Gem:

Add this line to your application's Gemfile:

    gem 'prophecy-monitor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install prophecy-monitor

### Configuration:

Copy and update the settings file to reflect the configuration for your environment:

    $ cp config/settings.yml.sample config/settings.yml
    $ vim config/settings.yml   # put your configuration settings in this file

## Usage

    # create a new monitor API instance for Voxeo Prophecy version 11
    monitor = Prophecy::Monitor.new :host    => '192.168.1.56',
                                    :port    => 9999,
                                    :options => { :api_version => '11' }

    # check whether the created monitor instance can connect to the Prophecy instance
    monitor.can_connect?   # true

    # retrieve a listing of browser type and corresponding active sessions
    monitor.total_sessions  # { "CallXML" => 0, "CCXML10" => 12 }

    # retrieve a listing of all application IDs and corresponding active sessions
    monitor.sessions_by_application_id  # { "2c9285d737762eb901377ad11daf00d7" => 0, "92928537z7362e110a3h7ah11cafn0d0" => 12 }

    # retrieve the total active sessions for a particular application ID
    monitor.sessions_for("92928537z7362e110a3h7ah11cafn0d0")   # 12

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
