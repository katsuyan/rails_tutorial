require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:michael)
    @activate = users(:archer)
    @non_activate = users(:katsuya)
  end

  test "show as activate user" do
    log_in_as(@admin)
    get user_path(@activate)
    assert_template 'users/show'
  end

  test "show as non activate user" do
    log_in_as(@admin)
    get user_path(@non_activate)
    assert_redirected_to root_path
  end

end
