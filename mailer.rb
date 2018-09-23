require_relative 'conf'

# mailing related methods
module Mailer
  def self.mailer_options
    {
      address: 'smtp.gmail.com',
      port: 587,
      user_name: Conf.mailer_username,
      password: Conf.mailer_password,
      authentication: 'plain',
      enable_starttls_auto: true
    }
  end

  def self.set_mailer
    options = mailer_options
    Mail.defaults do
      delivery_method :smtp, options
    end
  end

  def self.send_mail(recipient, sender, subject, body)
    Mail.deliver do
      to recipient
      from sender
      subject subject
      body body
    end
  end
end
