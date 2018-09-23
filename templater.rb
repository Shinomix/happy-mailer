# templating related methods
module Templater
  def self.template_anonymous?(pretty_recipient)
    pretty_recipient.nil?
  end

  def self.interpolate_template(template, sender, recipient)
    subject = template['subject']
    body = if template_anonymous?(recipient)
             template['body']
           else
             format(
               template['body'],
               recipient: recipient, sender: sender
             )
           end

    [subject, body]
  end

  def self.select_template(pretty_recipient)
    if template_anonymous?(pretty_recipient)
      Filer.anon_templates.sample
    else
      Filer.named_templates.sample
    end
  end
end
