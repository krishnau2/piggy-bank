class WishlistAccount < Account
  
  def amount      
    AllocationTransaction.total_deposit(self) - AllocationTransaction.total_withdrawal(self)
  end

end