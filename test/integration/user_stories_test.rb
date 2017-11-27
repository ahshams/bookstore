require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  LineItem.delete_all
  Order.delete_all
  ruby_book = products(:ruby)

  get "/"
  assert_response :success
  assert_template "index"

  #Replace this with your real tests
  test "the truth" do
    assert true
  end
end
