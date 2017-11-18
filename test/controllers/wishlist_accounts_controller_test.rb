require 'test_helper'

class WishlistAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wishlist_account = wishlist_accounts(:one)
  end

  test "should get index" do
    get wishlist_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_wishlist_account_url
    assert_response :success
  end

  test "should create wishlist_account" do
    assert_difference('WishlistAccount.count') do
      post wishlist_accounts_url, params: { wishlist_account: { amount: @wishlist_account.amount, name: @wishlist_account.name } }
    end

    assert_redirected_to wishlist_account_url(WishlistAccount.last)
  end

  test "should show wishlist_account" do
    get wishlist_account_url(@wishlist_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_wishlist_account_url(@wishlist_account)
    assert_response :success
  end

  test "should update wishlist_account" do
    patch wishlist_account_url(@wishlist_account), params: { wishlist_account: { amount: @wishlist_account.amount, name: @wishlist_account.name } }
    assert_redirected_to wishlist_account_url(@wishlist_account)
  end

  test "should destroy wishlist_account" do
    assert_difference('WishlistAccount.count', -1) do
      delete wishlist_account_url(@wishlist_account)
    end

    assert_redirected_to wishlist_accounts_url
  end
end
