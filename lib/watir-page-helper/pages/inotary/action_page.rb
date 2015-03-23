require 'watir-page-helper'

module WatirPageHelper::Inotary
  module ActionPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://uat.inotary.qwinixtech.com/"

   #Search

   def search_box
   	@browser.input(:xpath, "//div[2]/div[5]/div[1]/form/div[2]/input").send_keys("Tim")
   end

   def search_icon
   	@browser.span(:xpath, "//div[2]/div[5]/div[1]/form/div[2]/span").when_present.click
   end

   def search_result
   	sleep 5
   ele =  @browser.td(:xpath, "//div[2]/div[7]/table/tbody/tr/td[3]").text
   puts ele
   end 

   #Edit 
 
  def edit_icon
   	sleep 3
   	@browser.a(:xpath, "//div[7]/table/tbody/tr[1]/td[7]/div[1]/div[1]/a[2]").when_present.click
   end

   def edit_journal_entry
   	home = @browser.a(:xpath, "//div[2]/div[2]/div[2]/div/a")
   	if home.present?
   	return "Edit Journal entry page is displayed"    
   	else
    raise Exception.new "Edit Journal entry page is displayed"    
    end
   end

   def modify_field_data
   	@browser.checkbox(:xpath, "//div[1]/div/div[1]/label/input[2]").clear
   	@browser.a(:xpath, "//*[@id='myTab']/li[2]/a").when_present.click
   	@browser.a(:xpath, "//div[2]/div[2]/div/div[4]/div/div[2]/div/a").when_present.click
   	@browser.input(:xpath, "//div[2]/div[1]/div[2]/div/input").send_keys("AFGP123")
   	@browser.textarea(:xpath, "//div[2]/div[1]/div[3]/div/textarea").set("Added id")
   end


   def save_button
   	@browser.button(:xpath, "//div[2]/div[4]/form/div[3]/button").when_present.click
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

    #View 

   def view_icon
   	sleep 3
   	@browser.a(:xpath, "//div[7]/table/tbody/tr[1]/td[7]/div[1]/div[1]/a[1]").when_present.click
   end

   def view_journal_entry
   	home = @browser.a(:xpath, "//div[2]/div[4]/a[1]")
   	if home.present?
   	return "View Journal entry page is displayed"    
   	else
    raise Exception.new "View Journal entry page is not displayed"    
    end
   end

   #History

   def history
   history_button = @browser.a(:xpath, "//div[2]/div[4]/a[2]")	
      if history_button.present?
   	history_button.click
   	 return "History button is enabled"
    else
     raise Exception.new "History button is disabled"
    end
   end

   def email_button
   @browser.a(:xpath, "//div[2]/div[2]/div[2]/a[2]").when_present.click
   end

   def email_journal_history
   @browser.text_field(:id, "email").set("hychandrashekar@qwinixtech.com")
   sleep 2
   @browser.textarea(:xpath, "//div[2]/div/div/div[2]/div[2]/textarea").set("PFA.")
   end

   def submit_button 
   @browser.input(:xpath, "//div[2]/div/div/div[3]/input").when_present.click
   end

   def flash_msg_after_document_history_sent
   @browser.a(:xpath, "//div[2]/div[5]/div[3]/a").wait_until_present
     flash = @browser.p(:xpath, "//div[2]/div[2]/div/p").text
     flash_text = "The Document History has been sent"
  if flash.include? flash_text
    return "The Document History has been sent"
  else
   raise Exception.new "No error message displayed"
  end
  end

    #Version

    def version
    version_button = @browser.a(:xpath, "//div[2]/div[4]/a[3]")	
      if version_button.present?
   	version_button.click
   	 return "version button is enabled"
    else
     raise Exception.new "version button is disabled"
    end
   end

   def doc_version
   	sleep 3
    @browser.div(:xpath, "//div[2]/div[2]/div[4]/div[4]/div/div[2]/div[2]").when_present.click
    sleep 3
    @browser.a(:xpath, "//div[2]/div[3]/div[2]/div/a").when_present.click
   end

   #Email or Print Journal Entry

    def share_email_icon
   	sleep 3
   @browser.img(:xpath, "//div[7]/table/tbody/tr[1]/td[6]/div[1]/div[1]/a[1]/img").when_present.click
    end

   # email = @browser.img(:xpath, "//div[7]/table/tbody/tr[1]/td[6]/div[1]/div[1]/a[1]/img")
   #  if email.present?
   #    email.click
   #  return "Email button is enabled"
   # else
   #  raise Exception.new "Email button is disabled"
   # end

   def email_print_journal_entry
   	home = @browser.a(:xpath, "//div[2]/div[5]/div[2]/div/a")
   	if home.present?
   	return "email or print Journal entry page is displayed"    
   	else
    raise Exception.new "email or print Journal entry page is not displayed"    
    end
   end

   def redact_fields
   	@browser.checkbox(:xpath, "//div[3]/div/div[2]/div/div[1]/div[1]/input").set
  	@browser.checkbox(:xpath, "//div[3]/div/div[2]/div/div[2]/div[1]/input").set
  	@browser.checkbox(:xpath, "//div[3]/div/div[2]/div/div[3]/div[1]/input").set
  	@browser.checkbox(:xpath, "//div[3]/div/div[2]/div/div[4]/div[1]/input").set
  	@browser.checkbox(:xpath, "//div[2]/div/div/div[1]/div/div[2]/div[1]/input").set
   end

   def preview_button
   	@browser.button(:xpath, "//div[2]/div[6]/form/div[6]/button").when_present.click
   end

   def email_button_in_preview_screen
   	@browser.a(:xpath, "//div[2]/div[7]/a[2]").when_present.click
   end


   def flash_msg_after_journal_entry_sent
   @browser.a(:xpath, "//div[2]/div[5]/div[3]/a").wait_until_present
     flash = @browser.p(:xpath, "//div[2]/div[2]/div/p").text
     flash_text = "The Journal Entry has been sent"
  if flash.include? flash_text
    return "The Journal Entry has been sent"
  else
   raise Exception.new "No error message displayed"
  end
  end


   end
end