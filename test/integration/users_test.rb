require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "browse root and layout" do
    get root_path
    assert_template 'signup/new'
    assert_select "input.form-control", "Full name"
    assert_select "input.form-control", "Personal mobile number"
    assert_select "input.form-control", "Email"
    assert_select "input.form-control", "Company name"
    assert_select "input.form-control", "Office address"
    assert_select "input.btn", "Register now!"
  end

  test "POST data and redirect" do
    get root_path
    assert_response :success
    post_via_redirect root_path,
      full_name: users(:john).full_name,
      mobile_number: users(:john).mobile_number,
      email: users(:john).email,
      company_name: users(:john).company_name,
      company_address: users(:john).company_address
    assert_equal '/thank_you', path
    assert_select "h3", "Thanks for signing up Simon"
  end

end
