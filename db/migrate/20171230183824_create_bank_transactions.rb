class CreateBankTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_transactions do |t|
      t.references :account, foreign_key: true
      t.decimal :deposit_amount
      t.decimal :withdrawal_amount
      t.integer :from_account
      t.integer :to_account

      t.timestamps
    end
  end
end
