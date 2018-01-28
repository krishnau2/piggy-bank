class WishlistAccount < Account
  
  def amount
    deposit_amount = 1000
    withdrawal_amount = 500

    deposit_amount - withdrawal_amount
  end

end