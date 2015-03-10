require 'watir-page-helper'

module WatirPageHelper::Inotary
  module LoginPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://it.inotary.qwinixtech.com/"
     
	def click_customer_login
        @browser.a(:xpath, "//div[2]/ul/li[7]/ul/li[2]/a").wait_until_present
        @browser.a(:xpath, "//div[2]/ul/li[7]/ul/li[2]/a").click
    end
	
	def wait_for_login_page
	ele = @browser.input(:id, "user_email")
	ele.wait_until_present
	if ele.exists?
	return "login page is present"
	else
	raise Exception.new "Login page is not present"
	end
	end

	#User login

	def enter_user_data common_user
	@browser.input(:id, "user_email").wait_until_present
	@browser.input(:id, "user_email").send_keys common_user.username
	@browser.input(:id, "user_password").wait_until_present
	@browser.input(:id, "user_password").send_keys common_user.password
	end
	
	def click_sign_in
        @browser.button(:xpath, "//div[1]/form/div[5]/div[1]/div/button").wait_until_present
        @browser.button(:xpath, "//div[1]/form/div[5]/div[1]/div/button").click
    end

	def verify_list_page
        verify_listpage = @browser.a(:xpath,"//div[2]/div[5]/div[3]/a")
         verify_listpage.wait_until_present
        if verify_listpage.exists?
          return "List view page is displayed"
      else
         raise Exception.new "List view page is not displayed"
      end 
    end

    #Admin Login

    def enter_admin_data admin
	@browser.input(:id, "user_email").wait_until_present
	@browser.input(:id, "user_email").send_keys admin.username
	@browser.input(:id, "user_password").wait_until_present
	@browser.input(:id, "user_password").send_keys admin.password
	end

	#Invalid user

	def enter_invalid_user_data invalid_user
	@browser.input(:id, "user_email").wait_until_present
	@browser.input(:id, "user_email").send_keys invalid_user.username
	@browser.input(:id, "user_password").wait_until_present
	@browser.input(:id, "user_password").send_keys invalid_user.password
	end

	def blank_fields
	if @browser.span(:xpath,"//form[@id='user_sign_in']/div[*]/div/span").exists?
		return "Please specify firstname and lastname"
  else
	raise Exception.new "Error messages are not displaying"
   end
   end


    def invalid_data
    	sleep 5
    	if @browser.div(:xpath, "//div[@id='div_flash_message']").exists?
           return "Invalid Credentials"
        else
	raise Exception.new "Error messages are not displaying"
   end
   end

end
end