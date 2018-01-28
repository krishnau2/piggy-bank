class BankTransaction < ApplicationRecord
  belongs_to :account

  def self.total_deposit(account)
    self.where(account: account).sum('deposit_amount')
  end

  def self.total_withdrawal(account)
    self.where(account: account).sum('withdrawal_amount')
  end
end
