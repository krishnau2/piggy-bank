# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180204171641) do

  create_table "accounts", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.float "goal_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "allocation_transactions", force: :cascade do |t|
    t.integer "account_id"
    t.integer "bank_transaction_id"
    t.decimal "deposit_amount"
    t.decimal "withdrawal_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_allocation_transactions_on_account_id"
    t.index ["bank_transaction_id"], name: "index_allocation_transactions_on_bank_transaction_id"
  end

  create_table "bank_transactions", force: :cascade do |t|
    t.integer "account_id"
    t.decimal "deposit_amount"
    t.decimal "withdrawal_amount"
    t.integer "from_account"
    t.integer "to_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_bank_transactions_on_account_id"
  end

end
