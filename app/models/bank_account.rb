class BankAccount < Account
  
  def amount
    BankTransaction.total_deposit(self) - BankTransaction.total_withdrawal(self)
  end

end