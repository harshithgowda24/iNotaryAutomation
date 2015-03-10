require 'watir-webdriver'
require 'watir-page-helper/commands'
require 'watir-page-helper/extensions/element_extension'

World WatirPageHelper::Commands

#CONFIGFILE = YAML.load_file('configoptions.yml')

WatirPageHelper.create

#@browser = Watir::Browser.new ENV['BROWSER'] || CONFIGFILE['global']['browser']

WatirPageHelper.browser.window.maximize


FAILED_SCENARIOS_SCREENSHOTS_DIR = "failed_scenarios_screenshots"

After do |scenario|
  if scenario.failed?
     Dir::mkdir("#{FAILED_SCENARIOS_SCREENSHOTS_DIR}") if not File.directory?("#{FAILED_SCENARIOS_SCREENSHOTS_DIR}")
     screenshot = "./#{FAILED_SCENARIOS_SCREENSHOTS_DIR}/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime("%H_%M_%S__%d_%m_%Y")}.png"
     WatirPageHelper.browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
    Cucumber.wants_to_quit #= true if ((scenario.title).eql?("User login"))
  end

end

#puts "ENV => #{ENV.inspect}"
if ENV['HEADLESS'] == 'true'
  require 'headless'

  headless = Headless.new
  headless.start


  at_exit do
    headless.destroy
  end
else
  
  at_exit do
    WatirPageHelper.browser.close
  end
end


#--------------------------------> Start Order of Execution Code <-----------------------------------#
# Overrides the method +method_name+ in +obj+ with the passed block
def override_method(obj, method_name, &block)
  # Get the singleton class/eigenclass for 'obj'
  klass = class <<obj; self; end

  # Undefine the old method (using 'send' since 'undef_method' is protected)
  klass.send(:undef_method, method_name)

  # Create the new method
  klass.send(:define_method, method_name, block)
end

def get_weight(x)
  weights = YAML::load(File.open('features/support/data/order.yml')) #this is expensive but is done only on rake start
  weight = weights[x]
  if weight == nil or weight == ''
    weight = '800' #this is because we want to run the newly added tests first.
  end
  return weight.to_i()
end

def sort_according_to_weights(features)
  return features.sort { |x,y|  get_weight(y)  <=> get_weight(x)}
end

AfterConfiguration do |configuration|
  puts "\n\n\n *****  config: #{configuration} "
  featurefiles =  configuration.feature_files

  override_method(configuration, :feature_files) {
    puts "overriding the old featurefiles according to their weight"
    sorted_files = sort_according_to_weights(featurefiles);
    sorted_files
  }

  puts "\n\n **features will be executed in following order: \n"
  for i in configuration.feature_files
    puts "#{i} : weight: #{get_weight(i)}"
  end
end

#--------------------------------> End Order of Execution Code <-----------------------------------#
