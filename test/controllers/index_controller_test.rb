require "test_helper"

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should show enter page' do
    get index_enter_form_url
    assert_response :success
    assert_template 'index/enter_form'
    assert_select 'form'
  end

  test 'should show table' do
    get index_enter_form_url
    get result_url, params: { number: 3 }
    assert_response :success
    assert_not_nil assigns[:numbers]
    assert_template 'index/_result'
  end

  test 'should not show table' do
    get index_enter_form_url
    get result_url, params: { number: 2 }
    assert_response :success
    assert_empty assigns[:numbers]
    assert_template 'index/_result'
  end

  test 'should make output with selenium' do
    driver = Selenium::WebDriver.for :firefox
    begin
      driver.get 'http://localhost:3000/'
      driver.find_element(id: 'input').send_keys '12', :return
      Selenium::WebDriver::Wait.new(timeout: 10).until { assert driver.find_element(id: 'result').text.include? '17 19' }
      assert driver.find_element(id: 'res_table')
    ensure
      driver.quit
    end
  end

  def timeout_wait(driver)
    Selenium::WebDriver::Wait.new(timeout: 3).until { driver.find_element(id: 'res_table') }
  end

  test 'should not make output with selenium' do
    driver = Selenium::WebDriver.for :firefox
    begin
      driver.get 'http://localhost:3000/'
      driver.find_element(id: 'input').send_keys '2', :return
      assert_raise(Selenium::WebDriver::Error::TimeoutError) { timeout_wait driver }
    ensure
      driver.quit
    end
  end
end
