
class TestMailer < ActionMailer::Base

  self.template_root = File.join( File.dirname(__FILE__) )

  def test
    recipients 'test@test.com'
    from 'test@test.com'
  end

end