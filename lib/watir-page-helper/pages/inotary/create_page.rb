require 'watir-page-helper'

module WatirPageHelper::Inotary
  module CreatePage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://it.inotary.qwinixtech.com/"


    def create_entry_button
    @browser.a(:xpath, "//div[2]/div[5]/div[3]/a").when_present.click
    end

    def five_free
    pop_up = @browser.a(:xpath, "//*[@id='js-remaining-entrys-popup']/div/div/div[3]/a")
    if pop_up.present?
       pop_up.click
      return "You have exceeded three free journal entries per month."
    else
      raise Exception.new "No pop up"
    end
  end

    def create_journal_page
    home = @browser.a(:xpath, "//div[2]/div[2]/div[2]/div/a")
    if home.present?
    	return "Create Journal Page is displayed"
    else
    	raise Exception.new "Create Journal page is not displayed"
    end
    end

    def enter_client_info
    @browser.text_field(:id, "client_group_clients_attributes_0_first_name").set("client")
    @browser.text_field(:id, "client_group_clients_attributes_0_last_name").set("1")
	  @browser.text_field(:id, "client_group_clients_attributes_0_address_1").set("#32")
    @browser.text_field(:id, "client_group_clients_attributes_0_address_2").set("street")
  	@browser.text_field(:id, "client_group_clients_attributes_0_zip").set("80001")
  	@browser.text_field(:id, "client_group_clients_attributes_0_email").wait_until_present
  	@browser.text_field(:id, "client_group_clients_attributes_0_email").set("hychandrashekar@qwinixtech.com")
  	@browser.text_field(:id, "client_group_clients_attributes_0_telephone").set("988-648-4886")
  	@browser.checkbox(:id, "client_group_clients_attributes_0_is_favorite").set
    sleep 3
  	@browser.checkbox(:id, "client_group_clients_attributes_0_personals_attributes_0_personally_known").set
    sleep 3
    @browser.a(:xpath, "//*[@id='myTab']/li[2]/a").click
  	@browser.select_list(:id, "client_group_clients_attributes_0_verifiable_ids_attributes_0_id_type_id").select("Military ID")
    sleep 3
  	@browser.a(:xpath, "//*[@id='myTab']/li[3]/a").click
  	@browser.text_field(:id, "client_group_clients_attributes_0_credible_witnesses_attributes_0_first_name").set("witness")
  	@browser.text_field(:id, "client_group_clients_attributes_0_credible_witnesses_attributes_0_last_name").set("1")
  	@browser.text_field(:id, "client_group_clients_attributes_0_credible_witnesses_attributes_0_email").set("harshith@yopmail.com")
  	@browser.checkbox(:id, "client_group_clients_attributes_0_credible_witnesses_attributes_0_enable_cw_signature").set
    sleep 3
  	@browser.text_field(:id, "client_group_clients_attributes_0_documents_attributes_0_title").set("Passport")
  	@browser.text_field(:id, "client_group_clients_attributes_0_documents_attributes_0_date_of_document").set("12/24/2015")
  	@browser.select_list(:id, "client_group_clients_attributes_0_documents_attributes_0_inotary_act_id").select("Acknowledgment")
  	@browser.checkbox(:id, "client_group_clients_attributes_0_documents_attributes_0_is_favorite_document").set
    sleep 3
    @browser.a(:xpath, "//div[2]/div[2]/div/div[6]/div[2]/a").when_present.click
    @browser.input(:xpath, "//div[2]/div[3]/div[1]/div[1]/div/input").send_keys("Mysore")
    @browser.input(:xpath, "//div[2]/div[3]/div[1]/div[2]/div/input").send_keys("Marriage") 
    @browser.input(:xpath, "//div[2]/div[3]/div[1]/div[3]/div/div/input[2]").send_keys("03/02/2015")
    @browser.select_list(:xpath, "//div[2]/div[3]/div[1]/div[4]/div/select").select("Acknowledgment")
    @browser.a(:xpath, "//div[2]/div[2]/div/div[6]/div[3]/a").when_present.click
    @browser.input(:xpath, "//div[3]/div[3]/div[1]/div[1]/div/input").send_keys("Mysore")
    @browser.input(:xpath, "//div[3]/div[3]/div[1]/div[2]/div/input").send_keys("Green Card") 
    @browser.input(:xpath, "//div[3]/div[3]/div[1]/div[3]/div/div/input[2]").send_keys("07/02/2015")
    @browser.select_list(:xpath, "//div[2]/div/div[6]/div[3]/div[3]/div[1]/div[4]/div/select").select("Acknowledgment")

    sleep 1
    @browser.checkbox(:id, "email_checkbox").set
    end


    def save_all
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

    def verify_list_page
        verify_listpage = @browser.a(:xpath,"//div[2]/div[5]/div[3]/a")
         verify_listpage.wait_until_present
        if verify_listpage.exists?
          return "Journal Entry Created Successfully"
      else
         raise Exception.new "Journal Entry Created Successfully"
      end 
    end


    #Payment

    def upgrade_button
    @browser.a(:xpath, "//div[8]/div[2]/div/div[3]/div/a[1]").when_present.click
    end

    def buy_now
     buynow = @browser.a(:xpath,"//div[2]/div/div/div/div/table/tbody/tr/td[4]/a")
     if buynow.exists?
      buynow.click
      return "Buynow button displayed"
     else
      return "Redirected to Shipping and billing screen"
    end
  end


    def shipping_info
    @browser.text_field(:id, "credit_card_address_information_line1").set("Qwinix Technologies")
    @browser.text_field(:id, "credit_card_address_information_postal_code").set("80001")
    @browser.text_field(:id, "credit_card_address_information_line2").set("HIEMA ")
    @browser.text_field(:id, "credit_card_address_information_city").set("mysore")
    @browser.checkbox(:xpath, "//div[2]/form/div[8]/div[3]/input").set
    sleep 3
    @browser.text_field(:id, "input_coupon_secret_text").set("qwinix1")
    sleep 3
    @browser.select_list(:id, "credit_card_card_type").select("Visa")
    @browser.text_field(:id, "credit_card_number").set("123")
    @browser.text_field(:id, "credit_card_number").set("4539279199087547")
    @browser.select_list(:id, "credit_card_expire_month").select("9")
    @browser.select_list(:id, "credit_card_expire_year").select("2023")
    @browser.text_field(:id, "credit_card_cvv2").set("321")
    end

    def review_button
      @browser.button(:xpath,"//div[2]/form/div[14]/div/button").when_present.click
    end

    def pay_now_button
    @browser.button(:xpath,"//div[2]/form/div[3]/div[14]/div[2]/button").when_present.click
    end

    def thank_you
    if @browser.a(:xpath, "//div[2]/div[8]/a").exists?
      return "Thank You page is displayed"
    else
      raise Exception.new "Thank You page is not displayed"  
    end
  end


  #Create Journal entry by loading favorite

  def load_favorite_client
    select_from_favorite = @browser.select_list(:xpath, "//div[2]/div/div[1]/div[2]/div/div/div/select")
    if select_from_favorite.enabled?
      select_from_favorite.select("John Kenedy")
      return "Selected a existing favorite client."
    else
      raise Exception.new "Select drop down is disabled"
  end
end

def load_favorite_document
  sleep 5
    favorite_documents = @browser.select_list(:xpath, "//div[2]/div/div[6]/div[1]/div/div[1]/div[1]/div/select")
    if favorite_documents.enabled?
      favorite_documents.select("Passport")
      @browser.checkbox(:id, "email_checkbox").set
      @browser.checkbox(:id, "mobile_checkbox").set
      return "Selected existing favorite document."
    else
      raise Exception.new "Select drop down is disabled"
  end    
end

def add_another_client
  add_client_link = @browser.a(:xpath, "//div[2]/div[4]/form/div[3]/a")
  if add_client_link.present?
    add_client_link.click
    return "Add another client link is enabled."
else
  raise Exception.new "Add another client link is disabled"
 end
end

def load_favorite_client_2
    select_from_favorite = @browser.select_list(:xpath, "//div[3]/div[2]/div/div[1]/div[2]/div/div/div/select")
    if select_from_favorite.enabled?
      select_from_favorite.select("Tim Noik")
      sleep 3
      @browser.checkbox(:xpath, "//div[3]/div[2]/div/div[8]/div/div[1]/div[5]/div/div[1]/label/input[2]").set
      return "Selected existing favorite client 2"
    else
      raise Exception.new "Select drop down is disabled"
  end
end

end
end