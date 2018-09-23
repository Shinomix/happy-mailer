require_relative 'conf'

# config files loading related methods
module Filer
  def self.recipients_list
    @recipients_list
  end

  def self.named_templates
    @named_templates
  end

  def self.anon_templates
    @anon_templates
  end

  def self.parse_files
    parse_recipients_list
    parse_anonymous_templates
    parse_named_templates
  end

  def self.parse_recipients_list
    file = File.open(Conf.recipients_list, 'r')
    list = YAML.safe_load(file)

    @recipients_list = list
  end

  def self.parse_named_templates
    file = File.open(Conf.named_templates, 'r')
    list = YAML.safe_load(file)

    @named_templates = list
  end

  def self.parse_anonymous_templates
    file = File.open(Conf.anonymous_templates, 'r')
    list = YAML.safe_load(file)

    @anon_templates = list
  end
end
