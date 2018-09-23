#!/usr/bin/env ruby
require_relative 'conf'
require_relative 'filer'
require 'mail'
require_relative 'mailer'
require_relative 'templater'
require_relative 'utils'
require 'yaml'

def setup
  Mailer.set_mailer
  Filer.parse_files
end

def start_happier
  sender = Conf.mailer_username
  pretty_sender = Utils.pretty_name_from_email(sender)

  recipient = Filer.recipients_list.sample
  pretty_recipient = Utils.pretty_name_from_email(recipient)

  random_template = Templater.select_template(pretty_recipient)
  filled_template = Templater.interpolate_template(
    random_template, pretty_sender, pretty_recipient
  )

  Mailer.send_mail(recipient, sender, filled_template[0], filled_template[1])
end

setup
start_happier
