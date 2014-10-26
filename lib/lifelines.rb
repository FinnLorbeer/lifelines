require 'lifelines/version'
require 'rubygems'
require 'watir'
require 'watir-webdriver'
require 'watir-webdriver/wait'
require 'test/unit'
include Test::Unit::Assertions
require 'headless'
require 'random_data'

require 'lifelines/setup'
require 'lifelines/teardown'
require 'lifelines/error_logging'

def load_file(f)
  Dir[File.dirname(__FILE__) + "#{f}/*.rb"].each { |file| require file }
end

unless ARGV[0] == 'firefox' or ARGV[0] == 'headless' or ARGV[0] == 'chrome'
  abort ("you did not choose a correct browser. please choose 'firefox' or 'headless' or 'chrome'")
end
$arg = ARGV[0]
$all_arg = ARGV.join(" ")

load_file('/classes/**')
load_file('/tests/**')


