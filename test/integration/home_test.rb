require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "user statistic display" do
    log_in_as(@user)
    assert is_logged_in?
    get root_path
    assert_template 'static_pages/home'
    assert_select '#following', text: "#{@user.following.count}"
    assert_select '#followers', text: "#{@user.followers.count}"
  end
end
