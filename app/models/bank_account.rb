class BankAccount < Account
  
  def amount
    BankTransaction.total_withdrawal(self)
  end

end