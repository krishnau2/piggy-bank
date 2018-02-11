class AllocationTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :bank_transaction

  def self.total_deposit(account)
    self.where(account: account).sum('deposit_amount')
  end

  def self.total_withdrawal(account)
    self.where(account: account).sum('withdrawal_amount')
  end
end
