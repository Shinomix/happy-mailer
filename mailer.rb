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
    puts "> #{recipient} - #{sender}\n#{body}\n\n"
    # Mail.deliver do
    #   to target
    #   from emitter
    #   subject subject
    #   body body
    # end
  end
end
