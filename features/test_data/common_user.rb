require 'yaml'

class Common_user
  
  attr_accessor :username, :password

  def initialize(username,password)
    @username = username
    @password = password
  end

  def self.get_default_user
    self.get_user("common_user")
  end

  def self.get_user(user)
    path =File.dirname(__FILE__) + '/../config/user_data.yaml'
    users = YAML.load_file(path)
    Common_user.new(users[user]["username"],users[user]["password"])
  end
end

class Invalid_user
  
  attr_accessor :username, :password

  def initialize(username,password)
    @username = username
    @password = password
  end

  def self.get_default_user
    self.get_user("invalid_user")
  end

  def self.get_user(user)
    path =File.dirname(__FILE__) + '/../config/user_data.yaml'
    users = YAML.load_file(path)
    Invalid_user.new(users[user]["username"],users[user]["password"])
  end
end