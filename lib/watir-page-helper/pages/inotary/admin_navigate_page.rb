module WatirPageHelper::Inotary
  module AdminNavigatePage
    extend WatirPageHelper::ClassMethods
    
    direct_url "http://uat.inotary.qwinixtech.com/"
     
   #Redirecting User to Admin Screen

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

    def verfiy_admin_tools
    @browser.a(:xpath, "//div[2]/ul/li/ul/li[2]/a").wait_until_present
    @browser.a(:xpath, "//div[2]/ul/li/ul/li[2]/a").click
    end

    def verify_admin_page
      verify_admin_page = @browser.a(:xpath, "//div[2]/div[7]/a[2]")
        verify_admin_page.wait_until_present
        if verify_admin_page.exists?
          return "admin page is displaying"
      else
         raise Exception.new "admin page is not displaying"
      end 
    end

    end
    end