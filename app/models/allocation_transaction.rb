class AllocationTransaction < ApplicationRecord
  belongs_to :account
  belongs_to :bank_transaction
end
