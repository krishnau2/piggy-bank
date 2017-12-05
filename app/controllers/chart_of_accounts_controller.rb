class ChartOfAccountsController < ApplicationController
  def index
    @bank_accounts = BankAccount.all
    @wishlist_accounts = WishlistAccount.all
  end
end
