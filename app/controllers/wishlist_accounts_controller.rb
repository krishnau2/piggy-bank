class WishlistAccountsController < ApplicationController
  before_action :set_wishlist_account, only: [:show, :edit, :update, :destroy]

  # GET /wishlist_accounts
  # GET /wishlist_accounts.json
  def index
    @wishlist_accounts = WishlistAccount.all
  end

  # GET /wishlist_accounts/1
  # GET /wishlist_accounts/1.json
  def show
  end

  # GET /wishlist_accounts/new
  def new
    @wishlist_account = WishlistAccount.new
  end

  # GET /wishlist_accounts/1/edit
  def edit
  end

  # POST /wishlist_accounts
  # POST /wishlist_accounts.json
  def create
    @wishlist_account = WishlistAccount.new(wishlist_account_params)

    respond_to do |format|
      if @wishlist_account.save
        format.html { redirect_to chart_of_accounts_path, notice: 'Wishlist account was successfully created.' }
        format.json { render :show, status: :created, location: @wishlist_account }
      else
        format.html { render :new }
        format.json { render json: @wishlist_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlist_accounts/1
  # PATCH/PUT /wishlist_accounts/1.json
  def update
    respond_to do |format|
      if @wishlist_account.update(wishlist_account_params)
        format.html { redirect_to chart_of_accounts_path, notice: 'Wishlist account was successfully updated.' }
        format.json { render :show, status: :ok, location: @wishlist_account }
      else
        format.html { render :edit }
        format.json { render json: @wishlist_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlist_accounts/1
  # DELETE /wishlist_accounts/1.json
  def destroy
    @wishlist_account.destroy
    respond_to do |format|
      format.html { redirect_to chart_of_accounts_path, notice: 'Wishlist account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist_account
      @wishlist_account = WishlistAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_account_params
      params.require(:wishlist_account).permit(:name, :goal_amount)
    end
end
