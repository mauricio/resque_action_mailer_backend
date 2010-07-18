$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'resque_action_mailer_backend'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end
