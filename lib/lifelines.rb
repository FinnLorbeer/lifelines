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

$arg = ARGV[0]
$all_arg = ARGV.join(" ")

unless $arg == 'firefox' or $arg == 'headless' or $arg == 'chrome'
  abort ("you did not choose a correct browser. please choose 'firefox' or 'headless' or 'chrome'")
end


def load_file(f)
  Dir[File.dirname(__FILE__) + "#{f}/*.rb"].each { |file| require file }
end

load_file('/classes/**')
load_file('/tests/**')


