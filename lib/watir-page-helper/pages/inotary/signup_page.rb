require 'watir-page-helper'

module WatirPageHelper::Inotary
  module SignupPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://it.inotary.qwinixtech.com/"

    def wait_for_landing_page
	ele = @browser.a(:xpath, "//div[2]/ul/li[7]/ul/li[2]/a")
	ele.wait_until_present
	if ele.exists?
	return "landing page is present"
	else
	raise Exception.new "Landing page is not present"
	end
	end

	def click_create_account
        @browser.a(:xpath, "//div[2]/ul/li[7]/ul/li[1]/a").wait_until_present
        @browser.a(:xpath, "//div[2]/ul/li[7]/ul/li[1]/a").click
    end
	
	def wait_for_signup_page
	sign_up = @browser.text_field(:id, "user_first_name")
	sign_up.wait_until_present
	if sign_up.exists?
	return "Sign Up page is present"
	else
	raise Exception.new "Sign Up page is not present"
	end
	end
     
    def enter_user_data
	@browser.text_field(:id, "user_first_name").wait_until_present
	@browser.text_field(:id, "user_first_name").set("Kenedy")
	@browser.text_field(:id, "user_last_name").wait_until_present
	@browser.text_field(:id, "user_last_name").set("Toke")
    @browser.text_field(:id, "user_email").wait_until_present
	@browser.text_field(:id, "user_email").set("kenedy_6@yopmail.com")
	@browser.text_field(:id, "user_password").wait_until_present
	@browser.text_field(:id, "user_password").set("Qwinix123")
	@browser.select_list(:id, "user_state_id").wait_until_present
	@browser.select_list(:id, "user_state_id").select("Arizona")
	@browser.checkbox(:id, "terms").wait_until_present
	@browser.checkbox(:id, "terms").set
	end
	
	def click_join_button
        @browser.button(:xpath,"//div[3]/div/form/div[9]/div/button").wait_until_present
        @browser.button(:xpath,"//div[3]/div/form/div[9]/div/button").click
    end

    def alert_pop_up
    	alert = @browser.a(:xpath, "//div[5]/div/div/div/div[2]/div/a")
    	alert.wait_until_present
        if alert.exists?
           alert.click
           @browser.select_list(:id, "user_state_id").wait_until_present
	       @browser.select_list(:id, "user_state_id").select("Colorado")
	       	return "Pop Up displayed"
	   else
	   	   raise Exception.new "Pop up is not displayed"
       end
    end 


    def confirm_email
      if @browser.text_field(:id, "user_first_name").exists?
     raise Exception.new "Some fields data may be wrong"
   else
      return "Confirmation email has been sent to user email address"
    end
    end

    #Negative Signup

    def enter_invalid_user_data
	@browser.text_field(:id, "user_first_name").wait_until_present
	@browser.text_field(:id, "user_first_name").set("Harshith")
	@browser.text_field(:id, "user_last_name").wait_until_present
	@browser.text_field(:id, "user_last_name").set("Yc")
    @browser.text_field(:id, "user_email").wait_until_present
	@browser.text_field(:id, "user_email").set("john7@yopmail.com")
	@browser.text_field(:id, "user_password").wait_until_present
	@browser.text_field(:id, "user_password").set("Qwinix123")
	@browser.select_list(:id, "user_state_id").wait_until_present
	@browser.select_list(:id, "user_state_id").select("Alabama")
	@browser.checkbox(:id, "terms").wait_until_present
	@browser.checkbox(:id, "terms").set
	end

	def verify_error_messages
		@browser.span(:xpath,"//form[@id='signupform']/div[8]/div/div/span").exists?
		error = @browser.span(:xpath,"//form[@id='signupform']/div[*]/div/span")
		if error.exists?
       return "some fields are blank"
     else
      raise Exception.new "Some fields data may be still wrong error message is not displayed"
    end
    end


	def existing_email_address
      error_msg = @browser.span(:xpath, "//form[@id='signupform']/div[5]/div/span").text
        ele_text = "Email is already in use"
      if error_msg.include? ele_text
        return "email is already been taken"
    else
    	raise Exception.new "no error message"
	end	
   end
	
	#Forgot Password

	def forgot_password_link
    @browser.a(:xpath, "//div[3]/div[1]/form/div[5]/div[2]/a[1]").wait_until_present
    @browser.a(:xpath, "//div[3]/div[1]/form/div[5]/div[2]/a[1]").click
	end

	def enter_valid_email_id
	@browser.input(:xpath, "//div[6]/div/div/div/div[2]/form/div[2]/input").wait_until_present
    @browser.input(:xpath, "//div[6]/div/div/div/div[2]/form/div[2]/input").send_keys("john10@yopmail.com")
    end 

    def reset_password_button
    @browser.button(:xpath,"//div[2]/form/div[3]/div[2]/button").when_present.click
	end

	def flash_message_after_email_sent
	@browser.a(:xpath, "//div[2]/ul/li[7]/ul/li[2]/a").wait_until_present
     flash = @browser.p(:xpath, "//div[3]/div/div/div/p").text
     flash_text = "Reset password instructions has been sent to your email address."
	if flash.include? flash_text
	return "Reset password instructions has been sent to your email address."
  else
	raise Exception.new "Email id doesn't exists in our data base"
	end
   end



  end
end
