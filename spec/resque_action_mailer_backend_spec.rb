require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "resque_action_mailer_backend" do

  context 'on basic mailer calls' do

    before do
      ActionMailer::Base.delivery_method = :resque
    end

    it 'should send the email to resque on resque emails' do
      Headbanger::ResqueMailer.should_receive(:deliver)
      TestMailer.deliver_test
    end

  end

end
