class DepositsController < ApplicationController
  def index
    first_bank_account = BankAccount.first
    redirect_to deposit_path(first_bank_account.slug)
  end

  def show
    @title = "Deposit Action"
    @selected_bank = BankAccount.find_by(slug: params[:id])

    @bank_accounts = BankAccount.all
    @wishlist_accounts = WishlistAccount.all
  end

  def create
    puts params.inspect

    render json: params
  end

  
end