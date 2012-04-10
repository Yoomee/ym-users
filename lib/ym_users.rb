require 'devise'
require "ym_users/engine"
require "cancan"

if !defined?(User)
  user_model_path = File.join(%x(pwd).strip,"app/models/user.rb")
  if !File.exists?(user_model_path)
    user_template_path = File.join(File.expand_path(File.dirname(__FILE__)), "generators/ym_users/templates/models/user.rb")
    system("cp #{user_template_path} #{user_model_path}")
  end
end

module YmUsers
end

Dir[File.dirname(__FILE__) + '/ym_users/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/ym_users/controllers/*.rb'].each {|file| require file }