# naming for the project conf files and mailer settings
module Conf
  def self.mailer_username
    ENV.fetch('HAPPY_MAILER_USERNAME')
  end

  def self.mailer_password
    ENV.fetch('HAPPY_MAILER_PASSWORD')
  end

  def self.recipients_list
    'conf/recipients.yml'
  end

  def self.named_templates
    'conf/templates_named.yml'
  end

  def self.anonymous_templates
    'conf/templates_anon.yml'
  end
end
