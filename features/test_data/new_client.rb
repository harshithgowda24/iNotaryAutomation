require 'yaml'

class New_client
  
  attr_accessor :firstname, :lastname, :address, :zipcode, :email, :ph_no, :doc_title, :notarial_act

  def initialize(firstname,lastname,address,zipcode,email,ph_no,doc_title,notarial_act)
    @firstname = firstname
    @lastname = lastname
    @address = address
    @zipcode = zipcode
    @email = email
    @ph_no = ph_no
    @doc_title = doc_title
    @notarial_act = notarial_act

  end

  def self.get_default_user
    self.get_user("new_client")
  end

  def self.get_user(user)
    path =File.dirname(__FILE__) + '/../config/user_data.yaml'
    users = YAML.load_file(path)
    New_client.new(users[user]["firstname"],users[user]["lastname"],users[user]["address"],users[user]["zipcode"],users[user]["email"],users[user]["ph_no"],users[user]["doc_title"],users[user]["notarial_act"])
  end
end