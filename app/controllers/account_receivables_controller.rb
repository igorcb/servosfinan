class AccountReceivablesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_account_receivable, only: [:show, :edit, :update, :destroy, :lower, :pay]

  # GET /account_receivables
  # GET /account_receivables.json
  def index
    @account_receivables = AccountReceivable.all
  end

  # GET /account_receivables/1
  # GET /account_receivables/1.json
  def show
  end

  # GET /account_receivables/new
  def new
    @account_receivable = AccountReceivable.new
  end

  # GET /account_receivables/1/edit
  def edit
  end

  # POST /account_receivables
  # POST /account_receivables.json
  def create
    @account_receivable = AccountReceivable.new(account_receivable_params)

    respond_to do |format|
      if @account_receivable.save
        format.html { redirect_to @account_receivable, notice: 'Account receivable was successfully created.' }
        format.json { render :show, status: :created, location: @account_receivable }
      else
        format.html { render :new }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_receivables/1
  # PATCH/PUT /account_receivables/1.json
  def update
    respond_to do |format|
      if @account_receivable.update(account_receivable_params)
        format.html { redirect_to @account_receivable, notice: 'Account receivable was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_receivable }
      else
        format.html { render :edit }
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_receivables/1
  # DELETE /account_receivables/1.json
  def destroy
    @account_receivable.destroy
    respond_to do |format|
      format.html { redirect_to account_receivables_url, notice: 'Account receivable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def lower
    if @account_receivable.status == AccountReceivable::TipoStatus::PAGO
      flash[:danger] = "AccountReceivable already made payment."
      redirect_to account_receivables_path #(params[:id])
      return 
    end
    @cash_accounts = CashAccount.order('name')
    @cost_center = CostCenter.order('name')
    @payment_methods = PaymentMethod.order('name')
  end

  def pay
    if !params[:lower_receivables][:cost_center_id].present?
      flash[:danger] = "Cost Center can't be blank."
      redirect_to lower_account_receivable_path(params[:id])
      return 
    elsif !params[:lower_receivables][:cash_account_id].present?
      flash[:danger] = "Conta Corrente can't be blank."
      redirect_to lower_account_receivable_path(params[:id])
      return 
    elsif !params[:lower_receivables][:payment_method_id].present?
      flash[:danger] = "Forma de recebimento can't be blank."
      redirect_to lower_account_receivable_path(params[:id])
      return 
    elsif !params[:lower_receivables][:data_pagamento].present?
      flash[:danger] = "Data Pagamento can't be blank."
      redirect_to lower_account_receivable_path(params[:id])
      return 
    elsif !params[:lower_receivables][:valor_pago].present?
      flash[:danger] = "Valor do Pagamento can't be blank."
      redirect_to lower_account_receivable_path(params[:id])
      return
    end

    respond_to do |format|
      if @account_receivable.payament(params[:lower_receivables])
        format.html { redirect_to @account_receivable, flash: { success: "Lower AccountReceivables was successful." } }
        #format.json { render action: 'show', status: :created, location: @account_receivable }
      else
        format.html { redirect_to @account_receivable, flash: { danger: "Could not lower accounts receivable was successful." }}
        format.json { render json: @account_receivable.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_receivable
      @account_receivable = AccountReceivable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_receivable_params
      params.require(:account_receivable).permit(:type_account, :supplier_id, :cost_center_id, :payment_method_id, :documento, 
        :data_vencimento, :valor, :observacao,
        lower_receivables: [:payment_method_id, :data_pagamento, :valor_pago, :juros, :desconto, :total_pago, :observacao]
        )
    end
end
