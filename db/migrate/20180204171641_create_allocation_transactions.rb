class CreateAllocationTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :allocation_transactions do |t|
      t.references :account, foreign_key: true
      t.references :bank_transaction, foreign_key: true
      t.decimal :deposit_amount
      t.decimal :withdrawal_amount

      t.timestamps
    end
  end
end
