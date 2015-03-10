require 'yaml'

class Admin_user
  
  attr_accessor :username, :password

  def initialize(username,password)
    @username = username
    @password = password
  end

  def self.get_admin_user
    self.get_user("admin_user")
  end

  def self.get_user(user)
    path =File.dirname(__FILE__) + '/../config/user_data.yaml'
    users = YAML.load_file(path)
    Admin_user.new(users[user]["username"],users[user]["password"])
  end
end