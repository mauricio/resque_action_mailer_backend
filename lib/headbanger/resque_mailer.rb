
module Headbanger ; end

class Headbanger::ResqueMailer

  @queue = :headbanger_resque_mailer

  class << self

    def queue
      @queue
    end

    def queue=( new_queue )
      @queue = new_queue
    end

    def deliver( mail )
      destinations = mail.destinations
      mail.ready_to_send
      Resque.enqueue(
        Headbanger::ResqueMailer,
        :destinations => destinations,
        :mail => mail.encoded,
        :from => mail.from )
    end

    def perform( options )
      new( options ).deliver
    end

  end

  def initialize( options )
    @options = options.symbolize_keys
  end

  def deliver
    smtp = Net::SMTP.new(smtp_settings[:address], smtp_settings[:port])
    smtp.enable_starttls_auto if smtp_settings[:enable_starttls_auto] && smtp.respond_to?(:enable_starttls_auto)
    from = (@options[:from] && @options[:from].first) || smtp_settings[:user_name]
    smtp.start(
      smtp_settings[:domain],
      smtp_settings[:user_name],
      smtp_settings[:password],
      smtp_settings[:authentication]) do |smtp|
        smtp.sendmail(@options[:mail], from, @options[:destinations])
    end
  end

  def smtp_settings
    ActionMailer::Base.smtp_settings
  end

end