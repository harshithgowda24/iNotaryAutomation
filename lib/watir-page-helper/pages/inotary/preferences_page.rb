module WatirPageHelper::Inotary
  module PreferencesPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://uat.inotary.qwinixtech.com/"
     
   #Redirecting User to Admin Screen

    def admin_preferences
    @browser.a(:xpath, "//div/div[2]/ul/li/ul/li[3]/a").wait_until_present
    @browser.a(:xpath, "//div/div[2]/ul/li/ul/li[3]/a").click
    end

    def verify_admin_preferences
     verfiy_admin_preferences = @browser.a(:xpath, "//div[2]/div[4]/div[1]/div[1]/ul/li[2]/a")
       verfiy_admin_preferences.wait_until_present
        if verfiy_admin_preferences.exists?
          return "admin preferences is displaying"
      else
         raise Exception.new "admin preferences is not displaying"
      end 
    end

    def select_user_state
      @browser.select_list(:id, "state_id").wait_until_present
      @browser.select_list(:id, "state_id").select("Alaska")
    end


    def enable_disable_block
      #block address1 field
      sleep 3
      @browser.img(:xpath, "//div[1]/table/tbody/tr[3]/td[4]/span/label/img").wait_until_present
      @browser.img(:xpath, "//div[1]/table/tbody/tr[3]/td[4]/span/label/img").click
      #Enable dob in verifiable id
      sleep 3
      @browser.img(:xpath, "//div[2]/table[3]/tbody/tr[3]/td[6]/span/label/img").wait_until_present
      @browser.img(:xpath, "//div[2]/table[3]/tbody/tr[3]/td[6]/span/label/img").click
      #Disable ID Type / Title in credible witness
      sleep 3
      @browser.img(:xpath, "//div[2]/table[4]/tbody/tr[6]/td[3]/span/label/img").wait_until_present
      @browser.img(:xpath, "//div[2]/table[4]/tbody/tr[6]/td[3]/span/label/img").click
    end

    def save_button_preference_page
      sleep 2
      @browser.button(:xpath, "//div[2]/div[2]/div[5]/div[2]/button").when_present.click
      @browser.alert.exists?
      @browser.alert.ok
    end
 
    #Notarail Act

    def verify_notarial_act
     verify_acts = @browser.a(:xpath, "//div[2]/div[4]/div[1]/div[1]/ul/li[2]/a")
        if verify_acts.exists?
          verify_acts.click
          return "notarial act Screen is displaying"
      else
         raise Exception.new "notarial act screen is not displaying"
      end 
    end

    def empty_notarial_act
      @browser.button(:xpath, "//div[2]/div/div[1]/div[2]/div/button").wait_until_present
      @browser.button(:xpath, "//div[2]/div/div[1]/div[2]/div/button").click
      @browser.button(:xpath, "//div[2]/form/div[3]/button").wait_until_present
      @browser.button(:xpath, "//div[2]/form/div[3]/button").click
      error = @browser.span(:xpath, "//div[2]/form/div[2]/span")
        if error.present?
       return "Please specify the Notarial Act."
    else
     raise Exception.new "Please specify the Notarial Act message is not displayed"
    end
  end


    def verify_add_new_notarial_act_button
    @browser.button(:xpath, "//div[2]/div/div[1]/div[2]/div/button").wait_until_present
    @browser.button(:xpath, "//div[2]/div/div[1]/div[2]/div/button").click
    @browser.text_field(:id, "inotary_act_name").wait_until_present
    @browser.text_field(:id, "inotary_act_name").set("Verify Act")
    @browser.button(:xpath, "//div[2]/form/div[3]/button").wait_until_present 5
    @browser.button(:xpath, "//div[2]/form/div[3]/button").when_present.click
    sleep 3
    end

    def verify_notarail_act_list
    sleep 8
    ele = @browser.td(:xpath, "//div[3]/form/div[2]/table/tbody/tr[7]/td[5]").text
    ele_text = "Verify Act"
    if ele.include? ele_text
      return "Verify Act"
    else
      raise Exception.new "Act not created"
    end
    end

   def delete_button
    @browser.a(:xpath, "//div[2]/table/tbody/tr[7]/td[8]/a").when_present.click
    @browser.alert.exists?
    @browser.alert.ok
    sleep 3
    end

    def verify_act_is_not_present
    sleep 8
    ele = @browser.a(:xpath, "//div[2]/table/tbody/tr[7]/td[8]/a")
    if ele.exists?
      raise Exception.new "Act not deleted"
    else
      return "Act deleted"
    end
    end

    def verify_logout
    @browser.a(:xpath, "//div/div[2]/ul/li/ul/li[10]/a").wait_until_present
    @browser.a(:xpath, "//div/div[2]/ul/li/ul/li[10]/a").click
    end  

    #Add Favorite client
 
   def preferences_tab
      @browser.a(:xpath,"//div/div[2]/ul/li/ul/li[5]/a").when_present.click  
   end

   def preferences_screen
    preferences_page = @browser.a(:xpath, "//div[2]/div[4]/div[2]/div/a[1]")
    preferences_page.wait_until_present
    if preferences_page.exists?
      return "Preferences page is displayed"
    else
      raise Exception.new "preferences page is not displayed"
   end
 end


    def edit_favorites
    @browser.a(:xpath, "//div[2]/div[4]/div[1]/ul/li[2]/a").when_present.click
    end

    def add_favorite_info
    @browser.select_list(:id, "favorite_id").wait_until_present
    @browser.select_list(:id, "favorite_id").select("Add a Favorite")
    sleep 5
    @browser.text_field(:id, "favorite_client_attributes_first_name").set("John")
    @browser.text_field(:id, "favorite_client_attributes_last_name").set("Kenedy")
    @browser.text_field(:id, "favorite_client_attributes_address_1").set("#3000")
    @browser.text_field(:id, "favorite_client_attributes_zip").set("80009")
    @browser.text_field(:id, "favorite_client_attributes_email").wait_until_present
    @browser.text_field(:id, "favorite_client_attributes_email").set("hychandrashekar@qwinixtech.com")
    @browser.text_field(:id, "favorite_client_attributes_telephone").set("988-648-4886")
    sleep 2
    @browser.checkbox(:id, "favorite_personal_attributes_personally_known").set
    sleep 2
    @browser.a(:xpath, "//div[3]/div/form/div[5]/ul/li[2]/a").click
    @browser.text_field(:id, "favorite_verifiable_ids_attributes_0_id_number").set("DHRES")
    end

    def save_button
    @browser.button(:xpath,"//div[3]/div/form/div[5]/div[2]/button").when_present.click
    sleep 5
    end

    def fav_pop_up
    @browser.a(:xpath,"//div[18]/div/div/div[3]/a").wait_until_present 10
    @browser.a(:xpath,"//div[18]/div/div/div[3]/a").click
    @browser.select_list(:id, "favorite_id").wait_until_present
    @browser.select_list(:id, "favorite_id").select("Add a Favorite")
    sleep 5
    @browser.text_field(:id, "favorite_client_attributes_first_name").set("Tim")
    @browser.text_field(:id, "favorite_client_attributes_last_name").set("Noik")
    @browser.text_field(:id, "favorite_client_attributes_address_1").set("#3000")
    @browser.text_field(:id, "favorite_client_attributes_zip").set("80009")
    @browser.text_field(:id, "favorite_client_attributes_email").wait_until_present
    @browser.text_field(:id, "favorite_client_attributes_email").set("hshri@qwinixtech.com")
    @browser.text_field(:id, "favorite_client_attributes_telephone").set("988-648-4886")
    sleep 2
    @browser.checkbox(:id, "favorite_personal_attributes_personally_known").set
    @browser.button(:xpath,"//div[3]/div/form/div[5]/div[2]/button").when_present.click  
    @browser.a(:xpath,"//div[18]/div/div/div[3]/a").when_present.click 
    end

    #Add favorite document

    def edit_favorite_documents
    @browser.a(:xpath, "//div[2]/div[4]/div[1]/ul/li[3]/a").when_present.click
    end

    def add_favorite_doc_info
    @browser.select_list(:id, "document_favorite_id").wait_until_present
    @browser.select_list(:id, "document_favorite_id").select("Add a Favorite Document")
    sleep 5
    @browser.text_field(:id, "document_favorite_notarization_location").set("mysore")
    @browser.text_field(:id, "document_favorite_title").set("Driver licence")
    @browser.select_list(:id, "document_favorite_inotary_act_id").select("Certified Copy")
    end

    def save_doc_info_button
    @browser.button(:xpath,"//div[3]/div/form/div[4]/button").when_present.click
    sleep 5
    end

    def fav_doc_pop_up
    @browser.a(:xpath,"//div[21]/div/div/div[3]/a").wait_until_present 10
    @browser.a(:xpath,"//div[21]/div/div/div[3]/a").click
    @browser.select_list(:id, "document_favorite_id").wait_until_present
    @browser.select_list(:id, "document_favorite_id").select("Add a Favorite Document")
    sleep 5
    @browser.text_field(:id, "document_favorite_notarization_location").set("Denver")
    @browser.text_field(:id, "document_favorite_title").set("Ration Card")
    @browser.select_list(:id, "document_favorite_inotary_act_id").select("Certified Copy")
    @browser.button(:xpath,"//div[3]/div/form/div[4]/button").when_present.click 
    @browser.a(:xpath,"//div[21]/div/div/div[3]/a").when_present.click
    end
  
end
end