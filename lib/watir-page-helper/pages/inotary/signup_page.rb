require 'watir-page-helper'

module WatirPageHelper::Inotary
  module SignupPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://uat.inotary.qwinixtech.com/"

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
	@browser.text_field(:id, "user_email").set("kene2@yopmail.com")
	sleep 5
	@browser.text_field(:id, "user_password").wait_until_present 
	@browser.text_field(:id, "user_password").set("Qwinix123")
	@browser.select_list(:id, "user_state_id").wait_until_present
	@browser.select_list(:id, "user_state_id").select("Arizona")
	@browser.checkbox(:id, "terms").wait_until_present
	@browser.checkbox(:id, "terms").set
	end
	
	def click_join_button
        @browser.button(:xpath,"//button[@id='signupsubmit']").wait_until_present
        @browser.button(:xpath,"//button[@id='signupsubmit']").click
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


    def confirm_user
     @browser.a(:xpath, "//div[2]/div[5]/div[3]/a").wait_until_present
     flash = @browser.p(:xpath, "//div[2]/div[2]/div/p").text
     flash_text = "Signed up successfully"
	if flash.include? flash_text
	return "#{flash}"
  else
	raise Exception.new "#{flash} is not present"
	end
   end

    #Negative Signup

    def enter_invalid_user_data
	@browser.text_field(:id, "user_first_name").wait_until_present
	@browser.text_field(:id, "user_first_name").set("John")
	@browser.text_field(:id, "user_last_name").wait_until_present
	@browser.text_field(:id, "user_last_name").set("Yc")
	@browser.text_field(:id, "user_password").wait_until_present
	@browser.text_field(:id, "user_password").set("Qwinix123")
	@browser.select_list(:id, "user_state_id").wait_until_present
	@browser.select_list(:id, "user_state_id").select("Arizona")
	@browser.checkbox(:id, "terms").wait_until_present
	@browser.checkbox(:id, "terms").set
    @browser.text_field(:id, "user_email").wait_until_present
	@browser.text_field(:id, "user_email").set("harshith@yopmail.com")
	sleep 5
	end

	def verify_error_messages
	error_msg = @browser.span(:xpath,"//form[@id='signupform']/div[*]/div/span").text
	error_text = "Please specify First Name"
	if error_msg.include? error_text
       return "#{error_msg}"
     else
      raise Exception.new "#{error_msg} is not displayed"
    end
    end

    def terms_and_conditions
    error_msg = @browser.span(:xpath,"//form[@id='signupform']/div[8]/div/div/span").text
    error_text = "Please accept the terms and conditions"
    if error_msg.include? error_text
    return "#{error_msg}"
   else
	raise "#{error_msg} is not displayed"
    end
    end


	def existing_email_address
      error_msg = @browser.span(:xpath, "//form[@id='signupform']/div[5]/div/span").text
        ele_text = "Email already in use"
      if error_msg.include? ele_text
        return "#{error_msg}"
    else
    	raise Exception.new "#{error_msg} no error message"
	end	
   end

   #Sign Up for Pro
    
    def solutions_tab
    	@browser.a(:xpath, "//div/div[2]/ul/li[2]/a").when_present.click
    end

    def solutions_page
    solutions = @browser.a(:xpath, "//div[1]/div/div/div/div/ul/li[1]/a")
	solutions.wait_until_present
	if solutions.exists?
	return "Solutions page is present"
	else
	raise Exception.new "Solutions page is not present"
	end
    end

    def buy_now_button
    @browser.a(:xpath, "//div[1]/div/table/tbody/tr[14]/td[3]/a").when_present.click
    end

    def sign_up_page_for_pro
    sign_up_pro = @browser.button(:xpath, "//div[9]/div/button")
    if sign_up_pro.exists?
      return "Sign up page is present"
    else
    	raise Exception.new "Sign up page is not present"
    end
    end

    def enter_pro_user_data
	@browser.text_field(:id, "user_first_name").wait_until_present
	@browser.text_field(:id, "user_first_name").set("Kenedy")
	@browser.text_field(:id, "user_last_name").wait_until_present
	@browser.text_field(:id, "user_last_name").set("Toke")
    @browser.text_field(:id, "user_email").wait_until_present
	@browser.text_field(:id, "user_email").set("kene3@yopmail.com")
	sleep 5
	@browser.text_field(:id, "user_password").wait_until_present 
	@browser.text_field(:id, "user_password").set("Qwinix123")
	@browser.select_list(:id, "user_state_id").wait_until_present
	@browser.select_list(:id, "user_state_id").select("Colorado")
	@browser.checkbox(:id, "terms").wait_until_present
	@browser.checkbox(:id, "terms").set
	end

	def continue_button
    @browser.button(:xpath, "//div[9]/div/button").when_present.click
	end

	def shipping_and_billing_page
	ele = @browser.a(:xpath, "//div/div[2]/ul/li/a")
	if ele.exists?
	return "shipping and Billing page is present"
	else
	raise Exception.new "shipping and Billing page is not present"
	end
    end

    def flash_message_after_signed_up_successfully
    @browser.a(:xpath, "//div[2]/div[5]/div[3]/a").wait_until_present
     flash = @browser.p(:xpath, "//div[2]/div[2]/div/p").text
     flash_text = "Your account has been successfully created and Invoice confirmation have been sent to your email address."
	if flash.include? flash_text
	return "#{flash}"
  else
	raise Exception.new "#{flash} is not present"
	end
   end





	
	#Forgot Password
	def forgot_password_link
    @browser.a(:xpath, "//div[3]/div[1]/form/div[5]/div[2]/a[1]").wait_until_present
    @browser.a(:xpath, "//div[3]/div[1]/form/div[5]/div[2]/a[1]").click
	end

	def enter_valid_email_id
	@browser.input(:xpath, "//div[6]/div/div/div/div[2]/form/div[2]/input").wait_until_present
    @browser.input(:xpath, "//div[6]/div/div/div/div[2]/form/div[2]/input").send_keys("harshith@yopmail.com")
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
