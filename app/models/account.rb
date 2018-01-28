class Account < ApplicationRecord
  has_many :bank_transactions

  def amount
    return nil
  end
end
