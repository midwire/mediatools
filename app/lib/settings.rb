# frozen_string_literal: true

require 'singleton'
require 'yaml'

# Simple class for YAML settings
class Settings
  include Singleton

  attr_reader :file
  attr_reader :config

  def initialize(file = Rails.root.join('config', 'settings.yml'))
    @file = file
  end

  def load
    @config ||= YAML.load_file(file) || {}
    self
  end

  def save
    File.open(file, 'w') { |thefile| thefile.write(YAML.dump(config)) }
    self
  end

  def [](key)
    load
    config[key]
  end

  def []=(key, value)
    load
    config[key] = value
  end

  def data
    load
    config
  end

  def all
    load
    config
  end
end
