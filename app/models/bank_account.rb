class BankAccount < Account
  
  def net_amount
    BankTransaction.total_deposit(self) - BankTransaction.total_withdrawal(self)
  end

end