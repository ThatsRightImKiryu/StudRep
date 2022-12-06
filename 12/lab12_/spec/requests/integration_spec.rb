require 'rails_helper'
require 'selenium-webdriver'
require 'spec_helper'

include RSpec::Expectations
  describe 'Checks registration, login and calculations' do
    before(:each) do
        @driver = Selenium::WebDriver.for :firefox
    #     @driver.get("#{@base_url}/index/input")

    #     @base_url = 'http://localhost:3000'
    #     @driver.manage.timeouts.implicit_wait = 30
    #   end
    #   after(:each) do
    #     @driver.quit
      end
    it 'what' do
    @driver.get("#{@base_url}/users/new")
    @driver.find_element(:id, 'username').send_keys 'Lololoshka'
    @driver.find_element(:id, 'password').send_keys 'ILoveMinecraft'
    @driver.find_element(:id, 'password').click

    # follow_redirect!
    # assert_equal 200, status
    # assert_equal '/home', path
    end
  end


# it 'test_calc' do
#   @driver.find_element(:id, 'inpt').clear
#   @driver.find_element(:id, 'inpt').send_keys '14'
#   @driver.find_element(:id, 'submit_btn').click
#   verify { expect(@driver.find_element(:xpath, '//*[@id="result_tab"]//tr[2]').text).to eq('17 19') }
# end
