class DepositsController < ApplicationController
  def index
    first_bank_account = BankAccount.first
    redirect_to deposit_path(first_bank_account.slug)
  end

  def show
    @selected_bank = BankAccount.find_by(slug: params[:id])

    @bank_accounts = BankAccount.all
    @wishlist_accounts = WishlistAccount.all_details
  end

  def create
    puts params.inspect
    # {"deposits"=>
    #   {
    #     "depositAmount"=>"10000",
    #     "goalAllocation"=>
    #      {"3"=>"5000", "4"=>"2000", "8"=>"2000", "9"=>"1000"}
    #   },
    #   "selectedBankId"=>"1"
    # }

    @bank_account = BankAccount.find(params[:selected_bank_id])
    bank_transaction = BankTransaction.new()
    bank_transaction.account = @bank_account
    bank_transaction.deposit_amount = params[:deposits][:depositAmount]

    params[:deposits][:goalAllocation].each do |allocation_id, allocaiton_amount|
      allocation_account = WishlistAccount.find(allocation_id.to_i)
      allocation_transaction = AllocationTransaction.new()
      allocation_transaction.account = allocation_account
      allocation_transaction.deposit_amount = allocaiton_amount

      bank_transaction.allocation_transactions << allocation_transaction
    end

    if(bank_transaction.save)
      render json: {status: "ok"}
    else
      render json: {status: "failed"}
    end
  end
end