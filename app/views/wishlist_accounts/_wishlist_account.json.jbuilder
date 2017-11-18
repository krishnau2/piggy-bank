json.extract! wishlist_account, :id, :name, :amount, :created_at, :updated_at
json.url wishlist_account_url(wishlist_account, format: :json)
