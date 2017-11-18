class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :type
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
