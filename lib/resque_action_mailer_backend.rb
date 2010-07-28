require 'action_mailer'
require 'resque'
require 'headbanger/resque_mailer'

ActionMailer::Base.class_eval do

  def perform_delivery_resque(mail)
    Headbanger::ResqueMailer.deliver( mail )
  end

end