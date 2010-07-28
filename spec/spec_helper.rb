$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
gem 'resque'
gem 'actionmailer'

require 'resque_action_mailer_backend'
require 'spec'
require 'spec/autorun'
require 'test_mailer'