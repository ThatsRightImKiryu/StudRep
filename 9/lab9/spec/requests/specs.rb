require 'selenium-webdriver'

include RSpec::Expectations
describe 'View' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://localhost:3000'
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  def verify
    yield
  rescue ExpectationNotMetError => e
    @verification_errors << e
  end
  it 'test_calc' do
    @driver.get("#{@base_url}/index/input")
    @driver.find_element(:id, 'inpt').clear
    @driver.find_element(:id, 'inpt').send_keys '14'
    @driver.find_element(:id, 'submit_btn').click
    verify { @driver.find_element(:xpath, '//*[@id="result_tab"]//tr[2]').text.should == '17 19' }
  end
end
