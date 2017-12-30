class RenameAmountToGoalAmount < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :amount, :goal_amount
  end
end
