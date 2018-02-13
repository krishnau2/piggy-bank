class WishlistAccount < Account
  
  def net_amount
    AllocationTransaction.total_deposit(self) - AllocationTransaction.total_withdrawal(self)
  end

  def self.all_details
    all.map do |account|
      {
        id: account.id,
        name: account.name,
        goal_amount: account.goal_amount,
        net_amount: account.net_amount,
      }
    end
  end
end