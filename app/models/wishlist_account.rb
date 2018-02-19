class WishlistAccount < Account
  
  def total_deposit
    AllocationTransaction.total_deposit(self)
  end

  def total_withdrawal
    AllocationTransaction.total_withdrawal(self)
  end

  def net_amount
    total_deposit - total_withdrawal
  end

  def total_deposit_in_selected_bank(selected_bank_transaction_ids)
    AllocationTransaction.total_deposit(self, selected_bank_transaction_ids)
  end

  def total_withdrawal_in_selected_bank(selected_bank_transaction_ids)
    AllocationTransaction.total_withdrawal(self, selected_bank_transaction_ids)
  end

  def net_amount_in_selected_bank(selected_bank)
    bank_transaction_ids = selected_bank.bank_transactions.ids
    total_deposit_in_selected_bank(bank_transaction_ids) - total_withdrawal_in_selected_bank(bank_transaction_ids)
  end

  def self.all_details(selected_bank)
    all.map do |account|
      {
        id: account.id,
        name: account.name,
        goal_amount: account.goal_amount,
        net_amount: account.net_amount,
        total_in_selected_bank: account.net_amount_in_selected_bank(selected_bank)
      }
    end
  end
end