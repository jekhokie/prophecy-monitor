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

    gem 'tomcat-manager'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tomcat-manager

### Configuration:

Copy and update the settings file to reflect the configuration for your environment:

    $ cp config/settings.yml.sample config/settings.yml
    $ vim config/settings.yml   # put your configuration settings in this file

## Usage

TODO

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
