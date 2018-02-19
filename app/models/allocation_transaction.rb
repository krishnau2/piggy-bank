class AllocationTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :bank_transaction

  def self.total_deposit(account, bank_transaction_ids=nil)
    self.where(account: account)
        .where(with_selected_bank(bank_transaction_ids))
        .sum('deposit_amount')
  end

  def self.total_withdrawal(account, bank_transaction_ids=nil)
    self.where(account: account)
        .where(with_selected_bank(bank_transaction_ids))
        .sum('withdrawal_amount')
  end

  def self.with_selected_bank(bank_transaction_ids)
    {bank_transaction_id: bank_transaction_ids} unless bank_transaction_ids.blank?
  end
end
