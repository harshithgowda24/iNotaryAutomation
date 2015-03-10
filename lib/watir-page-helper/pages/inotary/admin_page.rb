require 'watir-page-helper'

module WatirPageHelper::Inotary
  module AdminPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://it.inotary.qwinixtech.com/admin"
     
#Redirecting User to Admin Screen

    def verify_admin_page
      verify_admin_page = @browser.a(:xpath, "//div[2]/div[7]/a[2]")
        verify_admin_page.wait_until_present
        if verify_admin_page.exists?
          return "admin page is displaying"
      else
         raise Exception.new "admin page is not displaying"
      end 
    end


#Adding user details and creating new user

    def verify_add_user_button
      @browser.a(:xpath, "//div[2]/div[7]/a[2]").wait_until_present
      @browser.a(:xpath, "//div[2]/div[7]/a[2]").click
    end

    def verify_add_user_page
     verify_add_user_page = @browser.input(:xpath,"//div[2]/form/div[3]/input")
        verify_add_user_page.wait_until_present
        if verify_add_user_page.exists?
          return "add user page is displaying"
      else
         raise Exception.new "add user page is not displaying"
      end 
    end
  

    def add_firstname firstname
    sleep 3
    @browser.input(:xpath,"//div[2]/form/div[3]/input").wait_until_present
    @browser.input(:xpath,"//div[2]/form/div[3]/input").send_keys firstname
    end

    def add_lastname lastname
    sleep 3
    @browser.input(:xpath,"//div[2]/form/div[4]/input").wait_until_present
    @browser.input(:xpath,"//div[2]/form/div[4]/input").send_keys lastname
    end

    def add_email email
     sleep 3
    @browser.input(:xpath,"//div[2]/form/div[5]/input").wait_until_present
    @browser.input(:xpath,"//div[2]/form/div[5]/input").send_keys email
    end

    def add_password password
     sleep 3
    @browser.input(:xpath,"//div[2]/form/div[6]/input").wait_until_present
    @browser.input(:xpath,"//div[2]/form/div[6]/input").send_keys password
    end

    def add_confirm confirm
     sleep 3
    @browser.input(:xpath,"//div[2]/form/div[7]/input").wait_until_present
    @browser.input(:xpath,"//div[2]/form/div[7]/input").send_keys confirm
    end

    def add_state 
     sleep 3
    @browser.select_list(:xpath,"//div[2]/form/div[8]/select").wait_until_present
    @browser.select_list(:xpath,"//div[2]/form/div[8]/select").select_value('7')
    end

    def add_user_button
    sleep 3
    @browser.button(:id,"input_user_signin").wait_until_present
    @browser.button(:id,"input_user_signin").click 
    end

    def flash_message_after_create
    sleep 5
      flash_msg = @browser.p(:xpath, "//div[2]/div[2]/div/p").text
        ele_text = "User created successfully"
      if flash_msg.include? ele_text
         return "User Created Successfully"
      else
       raise Exception.new "User is not created"
     end
    end

    def verify_error_messages
      error = @browser.span(:xpath, "//form[@id='add_user_form_js']/div[*]/span")
      if error.exists?
       return "some fields are blank"
     else
      raise Exception.new "Some fields data may be still wrong error message is not displayed"
    end
    end

    def email_id
    sleep 5
      error_msg = @browser.span(:xpath, "//div[6]/div/div/div/div[2]/form/div[5]/span").text
        ele_text = "Email is already in use"
      if error_msg.include? ele_text
        @browser.text_field(:id, "user_last_name").clear
        @browser.text_field(:id, "user_email").set("john20@yopmail.com")
        @browser.text_field(:id, "user_password_for_admin").set("Qwinix123")
        @browser.text_field(:id, "user_password_confirmation").set("Qwinix123")
        @browser.button(:id,"input_user_signin").click 
       return "Email is already in use"
      else
       raise Exception.new "Email is already in use error message not displayed"
     end
    end



#Search for a user


    def enter_user_email
   @browser.text_field(:id, "search").wait_until_present
   @browser.text_field(:id, "search").set("john19@yopmail.com")
    end

    def click_search_icon
    @browser.span(:xpath, "//div[2]/div[8]/div/form/div[2]/span/span").wait_until_present
    @browser.span(:xpath, "//div[2]/div[8]/div/form/div[2]/span/span").click
    end

    def display_user
    ele = @browser.div(:xpath, "//div[2]/div[9]/table/tbody/tr/td[1]/div").text
    ele_text = "John"
    if ele.include? ele_text
     puts ele
    else
      return "No Results found"  
    end
    end




#Block/Unblock user Account

    def block_button
      @browser.a(:xpath, "//div[2]/div[9]/table/tbody/tr/td[7]/a[2]").wait_until_present
      if @browser.a(:xpath, "//div[2]/div[9]/table/tbody/tr/td[7]/a[2]").exists?
          @browser.a(:xpath, "//div[2]/div[9]/table/tbody/tr/td[7]/a[2]").click
          @browser.alert.exists?
          @browser.alert.ok
          sleep 3
          return "User blocked Successfully"
      else
        raise Exception.new "Block feature is not available"
      end
    end

   

#Edit User Details

    def verify_edit_icon
    @browser.img(:xpath, "//div[2]/div[9]/table/tbody/tr[1]/td[8]/a/img").wait_until_present
    @browser.img(:xpath, "//div[2]/div[9]/table/tbody/tr[1]/td[8]/a/img").click
   end

   def verify_edit_user_details_page
    verify_edit_user_details_page = @browser.input(:xpath, "//div[6]/div/div/div/div[2]/form/div[4]/input")
         verify_edit_user_details_page.wait_until_present
        if verify_edit_user_details_page.exists?
          return "edit user details page is displaying"
      else
         raise Exception.new "edit user details page is not displaying"
      end 
   end

   def flash_message_after_update
   sleep 5
      flash_msg = @browser.p(:xpath, "//div[2]/div[2]/div/div/p").text
        ele_text = "User updated successfully"
      if flash_msg.include? ele_text
         return "User updated successfully"
      else
       raise Exception.new "User is not updated"
     end
    end


   def verify_add_subscription_dropdown
    pro = @browser.select_list(:id, "subscription_type_of_subscription")
     pro.wait_until_present
     if pro.exists?
     pro.select("Pro User")
   else
    raise Exception.new "User might be Pro/Business"
    end
   end

   def clear_data
     @browser.text_field(:id, "user_first_name").clear
     @browser.text_field(:id, "user_last_name").clear
     @browser.text_field(:id, "user_email").clear
   end

   def click_close
     @browser.button(:xpath, "//div[6]/div/div/div/div[1]/button").wait_until_present
   @browser.button(:xpath, "//div[6]/div/div/div/div[1]/button").click
   end

   def verify_errors
    if @browser.span(:xpath, "//div[6]/div/div/div/div[2]/form/div[4]/span").exists?
      @browser.span(:xpath, "//div[6]/div/div/div/div[2]/form/div[5]/span").exists?
      @browser.span(:xpath, "//div[6]/div/div/div/div[2]/form/div[6]/span").exists?
      return "Error messages displayed"
     else
      raise Exception.new "Some fields data may be empty"
   end
 end

   def verify_start_date
   @browser.text_field(:id, "subscription_start_date").set("03/24/2015")
   end
   
   def verify_end_date
   @browser.text_field(:id, "subscription_end_date").set("03/25/2015")
   end
 
   def verify_update_button
   @browser.button(:xpath, "//div[6]/div/div/div/div[2]/form/div[11]/button").wait_until_present
   @browser.button(:xpath, "//div[6]/div/div/div/div[2]/form/div[11]/button").click
   end

#Change User Password

   def verify_change_user_password_button
   @browser.a(:xpath, "//div/div/div/div[2]/form/div[3]/a").wait_until_present
   @browser.a(:xpath, "//div/div/div/div[2]/form/div[3]/a").click
   end
   
   def verify_change_password_screen
   @browser.button(:xpath, "//div[2]/form/div[5]/button").wait_until_present
   end

   def verify_missmatch_password
   @browser.text_field(:id, "user_password_for_admin").wait_until_present
   @browser.text_field(:id, "user_password_for_admin").set("Qwinix123")
   @browser.text_field(:id, "user_password_confirmation").wait_until_present
   @browser.text_field(:id, "user_password_confirmation").set("Qwinix1234")
   end

   def verify_same_password
   @browser.text_field(:id, "user_password_for_admin").wait_until_present
   @browser.text_field(:id, "user_password_for_admin").set("Qwinix123")
   @browser.text_field(:id, "user_password_confirmation").wait_until_present
   @browser.text_field(:id, "user_password_confirmation").set("Qwinix123")
   end

   def verify_change_password_button
    @browser.button(:xpath, "//div[2]/form/div[5]/button").wait_until_present
    @browser.button(:xpath, "//div[2]/form/div[5]/button").click
   end

   def flash_message_after_password_update
   sleep 5
      flash_msg = @browser.p(:xpath, "//div[2]/div[2]/div/p").text
        ele_text = "User password updated successfully"
      if flash_msg.include? ele_text
         return "User password updated successfully"
      else
       raise Exception.new "User is not updated"
     end
    end

   def verify_change_password_errors
    error_msg = @browser.span(:xpath, "//div[6]/div/div/div/div[2]/form/div[4]/span").text
        ele_text = "Password does not match"
      if error_msg.include? ele_text
         return "Password does not match"
      else
        raise Exception.new "Password does not match message is not displayed"
    end
   end
 

#Filter User by roles

    def verify_filter_owner
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").select("Owner")
    end

    def verify_filter_admin
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").select("Admin")
    end

    def verify_filter_manager
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").select("Manager")
    end

    def verify_filter_viewer
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").select("Viewer")
    end

    def verify_filter_author
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").select("Author")
    end

    def verify_filter_user
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[4]/select").select("User")
    end
 
    def verify_filter_button
    @browser.button(:xpath, "//div[2]/div[8]/form/div[6]/button").wait_until_present
    @browser.button(:xpath, "//div[2]/div[8]/form/div[6]/button").click
    end

    def verify_reset_button
    @browser.a(:xpath, "//div[2]/div[8]/form/div[6]/a").wait_until_present
    @browser.a(:xpath, "//div[2]/div[8]/form/div[6]/a").click
    end 

#Filter user by subcription 

    def verify_filter_free
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").select("Free User")
    end

    def verify_filter_pro
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").select("Pro User")
    end

    def verify_filter_business
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").select("Business User")
    end

    def verify_filter_fps
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").select("Free Pro Subscription")
    end

    def verify_filter_fbs
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").wait_until_present
    @browser.select_list(:xpath, "//div[2]/div[8]/form/div[3]/select").select("Free Business Subscription")
    end




#Masquerade user Account

    def masquerade_button
      if @browser.a(:xpath, "//div[2]/div[9]/table/tbody/tr[1]/td[7]/a[1]").exists?
          @browser.a(:xpath, "//div[2]/div[9]/table/tbody/tr[1]/td[7]/a[1]").click
          @browser.alert.exists?
          @browser.alert.ok
          sleep 3
      else
        return "Cancel"
      end
    end
  
    def stop_masquerade_button
    @browser.a(:xpath, "//div/div[2]/ul/li/ul/li[7]/a").wait_until_present
    @browser.a(:xpath, "//div/div[2]/ul/li/ul/li[7]/a").click
    end

    def verify_create_entry_button
    @browser.a(:xpath, "//div[2]/div[5]/div[3]/a").wait_until_present
    @browser.a(:xpath, "//div[2]/div[5]/div[3]/a").click
    pop_up = @browser.div(:xpath, "//div[23]/div/div/div[2]")
    if pop_up.present?
      raise Exception.new "You have exceeded three free journal entries per month. Please upgrade your Account."
    else
      return "Create New Journal entry page is displayed"
    end
  end

    def verify_create_journal_page
    @browser.text_field(:id, "client_group_clients_attributes_0_first_name").wait_until_present
    end

    def verify_save_all_button
    @browser.button(:xpath, "//button[@id='submitButtonId']").when_present.click
    pop_up1 = @browser.a(:xpath, "//div[11]/div/div/div[3]/a[2]")
    pop_up2 = @browser.a(:xpath, "//div[12]/div/div/div[3]/a[2]")
     if pop_up1.present?
      pop_up1.click
      return "Some of the state required fields have not been completed. Do you want to continue?"
    elsif pop_up2.present?
      pop_up2.click
      return "This entry will be marked as incomplete until your client(s) provides a signature. Do you want to continue?"
    else
      return "No Pop up - Redirected to list view screen"
    end
    end

    def enter_client_details
    @browser.text_field(:id, "client_group_clients_attributes_0_first_name").set("client1")
    @browser.text_field(:id, "client_group_clients_attributes_0_last_name").set("client2")
    @browser.text_field(:id, "client_group_clients_attributes_0_documents_attributes_0_title").set("passport")
    end



#Add a Coupon

    def verify_coupon_button
    @browser.a(:xpath, "//div[2]/div[7]/a[1]").wait_until_present
    @browser.a(:xpath, "//div[2]/div[7]/a[1]").click
    end

    def verify_manage_coupons_page
      @browser.a(:xpath, "//div[2]/div[4]/a").wait_until_present
    end

    def add_new_coupon
    @browser.a(:xpath, "//div[2]/div[4]/a").wait_until_present
    @browser.a(:xpath, "//div[2]/div[4]/a").click
    end

    def verify_add_coupon_page
      @browser.input(:xpath, "//div[2]/form/div[2]/input").wait_until_present
    end

    def add_coupon_code 
    verify_add_coupon_page
    @browser.text_field(:id, "coupon_coupon").wait_until_present
    @browser.text_field(:id, "coupon_coupon").set("INOTARYFREECOUPON")
    end

    def add_percentage
    @browser.text_field(:id, "coupon_discount").wait_until_present
    @browser.text_field(:id, "coupon_discount").set("75")
    end

    def verify_create_coupon
    @browser.input(:xpath, "//div[2]/form/div[4]/input").wait_until_present
    @browser.input(:xpath, "//div[2]/form/div[4]/input").click
    end


    def check_for_coupon_created
   sleep 3
   ele =  @browser.div(:xpath, "//div[2]/div[5]/table/tbody/tr[7]/td[1]/div").text
      puts ele
    end

    def existing_coupon
      sleep 3
      error_msg = @browser.span(:xpath, "//form[@id='add_coupon_form']/div[2]/span").text
        ele_text = "Coupon has already been taken."
      if error_msg.include? ele_text
        sleep 3
        return "Coupon has already been taken."
      else
        raise Exception.new "No message displayed"
      end
    end

    def coupon_list
      sleep 5
      if @browser.input(:xpath,"//div[2]/form/div[4]/input").present?
        @browser.input(:xpath,"//div[2]/form/div[3]/input").present?
     return "Please specify the Coupon"
   else
     raise Exception.new "No error message displayed"
    end
    end

    #Edit coupon
     
    def edit_coupon_icon
      @browser.img(:xpath, "//div[5]/table/tbody/tr[7]/td[5]/div/a[1]/img").when_present.click
    end 

    def edit_coupon_percentage
      @browser.text_field(:id, "coupon_discount").wait_until_present
      @browser.text_field(:id, "coupon_discount").clear
      @browser.text_field(:id, "coupon_discount").set("40")
      @browser.input(:xpath,"//div[2]/form/div[4]/input").when_present.click
    end

    def verify_updated_coupon_percentage
      sleep 5
      ele = @browser.div(:xpath, "//div[5]/table/tbody/tr[7]/td[2]/div").text
      puts ele
    end
    
    def delete_icon
    @browser.img(:xpath, "//div[5]/table/tbody/tr[7]/td[5]/div/a[2]/img").when_present.click
    @browser.alert.exists?
    @browser.alert.ok
    end

    def verify_coupon_is_not_present
    ele = @browser.img(:xpath, "//div[5]/table/tbody/tr[7]/td[5]/div/a[2]/img")
    if ele.exists?
      raise Exception.new "Coupon not deleted"
    else
      return "Coupon deleted"
    end
    end

  end
end