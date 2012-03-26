require "ym_users/engine"
require "cancan"

module YmUsers
end

Dir[File.dirname(__FILE__) + '/ym_users/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/ym_users/controllers/*.rb'].each {|file| require file }