# utility and formatting methods
module Utils
  def self.pretty_name_from_email(email)
    id = email.split('@').first
    names = id.split('.')

    return nil if names.length < 2 || names.first.length <= 1

    names.first.capitalize
  end
end
