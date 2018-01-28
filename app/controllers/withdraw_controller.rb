class WithdrawController < ApplicationController
  def index
    @title = "Withdraw Action"
    @wishlist_accounts = WishlistAccount.all
  end
end