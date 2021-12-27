require "test_helper"

class Laba11ControllerTest < ActionDispatch::IntegrationTest
  test 'should show enter page' do
    get laba11_enter_form_url
    assert_response :success
    assert_template 'laba11/enter_form'
    assert_select 'form'
  end

  test 'should show calculated result' do
    get laba11_result_table_url, params: { input: 1000 }
    assert_response :success
    assert_not_nil assigns[:values]
    assert_template 'laba11/result_table'
  end

  test 'should not show table' do
    get laba11_result_table_url, params: { input: 1 }
    assert_response :success
    assert_empty assigns[:values]
    assert_template 'laba11/result_table'
  end

  test 'should calculate different result' do
    get laba11_result_table_url, params: { input: 1001 }
    assert_response :success
    first_res = assigns[:values]
    get laba11_result_table_url, params: { input: 10_001 }
    second_res = assigns[:values]
    assert_not_equal first_res, second_res
  end
end
