class DepositController < ApplicationController
  def index
    @title = "Deposit Action"
    @wishlist_accounts = WishlistAccount.all
  end
end