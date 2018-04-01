class ApplicationMailer < ActionMailer::Base
  default from: 'cs@vavimex.com'
  layout 'mailer'

  def contact_me message, sender
    @body = message
    @customer = sender
    mail to: "httvan@vavimex.com", from: sender[:email]
  end
end
