require 'watir-page-helper'

module WatirPageHelper::Inotary
  module MyAccountPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://uat.inotary.qwinixtech.com/"

      def verify_username
          verify_username = @browser.a(:xpath, "//div/div[2]/ul/li/a")
           verify_username.wait_until_present
           verify_username.click
          if verify_username.exists?
            return "username is displaying"
        else
           raise Exception.new "username is not displaying"
        end 
      end

      def verify_my_account
    @browser.a(:xpath, "//div[2]/ul/li/ul/li[4]/a").wait_until_present
    @browser.a(:xpath, "//div[2]/ul/li/ul/li[4]/a").click
    end

    def verify_my_account_page
          verify_my_Account_page = @browser.a(:xpath, "//div[2]/div[3]/div[2]/a")
           verify_my_Account_page.wait_until_present
          if verify_my_Account_page.exists?
            return "account page is displaying"
        else
           raise Exception.new "account page is not displaying"
        end 
      end
   
   def verify_edit_icon
    @browser.span(:xpath, "//div[2]/div[6]/table/thead/tr/th[7]/a/span").wait_until_present
    @browser.span(:xpath, "//div[2]/div[6]/table/thead/tr/th[7]/a/span").click
    end

    def verify_edit_details_page
      verify_edit_details_page = @browser.input(:xpath, "//div[2]/form/div[2]/input")
           verify_edit_details_page.wait_until_present
          if verify_edit_details_page.exists?
            return "edit account page is displaying"
        else
           raise Exception.new "edit account page is not displaying"
        end 
      end

    def update_few_fields
      @browser.text_field(:id, "user_last_name").clear
      @browser.text_field(:id, "user_last_name").set("Gowda")
      @browser.select_list(:id, "user_state_id").select("Georgia")
      @browser.select_list(:id, "user_timezone").select("(GMT-11:00) Midway Island")
     end

    def verify_save_button
    sleep 3
    @browser.span(:xpath, "//div[6]/div/div/div/div[2]/form/div[13]/span").when_present.click
    end

    def verify_error_message
      sleep 5
    	ele = @browser.span(:xpath, "//div[6]/div/div/div/div[2]/form/div[6]/span")
      if ele.exists?
        return "Please specify current password"
      else
        raise Exception.new "Please specify current password message not displayed"
    end
    end

    def enter_current_password
      sleep 3
    @browser.text_field(:id, "user_current_password").set("Qwinix123")
    end

      def verify_updated_name
      @browser.a(:xpath, "//div[2]/div[3]/div[2]/a").wait_until_present
      ele = @browser.td(:xpath, "//div[6]/table/tbody/tr[2]/td[2]")
      if ele.exists?
        puts "Last Name - Gowda"
      else
        raise Exception.new "Last Name not updated"
      end
      end

    #Logout

    def user_logout
      @browser.a(:xpath, "//div[2]/ul/li/ul/li[8]/a").when_present.click
    end

  end
  end
