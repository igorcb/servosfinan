class AccountPayablesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_account_payable, only: [:show, :edit, :update, :destroy]

  # GET /account_payables
  # GET /account_payables.json
  def index
    @account_payables = AccountPayable.all
  end

  # GET /account_payables/1
  # GET /account_payables/1.json
  def show
  end

  # GET /account_payables/new
  def new
    @account_payable = AccountPayable.new
  end

  # GET /account_payables/1/edit
  def edit
  end

  # POST /account_payables
  # POST /account_payables.json
  def create
    @account_payable = AccountPayable.new(account_payable_params)

    respond_to do |format|
      if @account_payable.save
        format.html { redirect_to @account_payable, notice: 'Account payable was successfully created.' }
        format.json { render :show, status: :created, location: @account_payable }
      else
        format.html { render :new }
        format.json { render json: @account_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_payables/1
  # PATCH/PUT /account_payables/1.json
  def update
    respond_to do |format|
      if @account_payable.update(account_payable_params)
        format.html { redirect_to @account_payable, notice: 'Account payable was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_payable }
      else
        format.html { render :edit }
        format.json { render json: @account_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_payables/1
  # DELETE /account_payables/1.json
  def destroy
    @account_payable.destroy
    respond_to do |format|
      format.html { redirect_to account_payables_url, notice: 'Account payable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_payable
      @account_payable = AccountPayable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_payable_params
      params.require(:account_payable).permit(:type_account, :supplier_id, :cost_center_id, :payment_method_id, :documento, :data_vencimento, :valor, :observacao)
    end
end
