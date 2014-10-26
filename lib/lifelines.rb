require "lifelines/version"
require 'rubygems'
require 'watir'
require 'watir-webdriver'
require 'watir-webdriver/wait'
require 'test/unit'
include Test::Unit::Assertions
require 'colorize'
require 'headless'
require 'random_data'

require 'lifelines/setup'
require 'lifelines/teardown'
require 'lifelines/error_logging'

def load_file(f)
  Dir[File.dirname(__FILE__) + "#{f}/*.rb"].each { |file| require file }
end

$arguments = ARGV[0]
load_file('/classes/**')
load_file('/tests/**')


