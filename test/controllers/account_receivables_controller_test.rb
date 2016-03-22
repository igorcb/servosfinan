require 'test_helper'

class AccountReceivablesControllerTest < ActionController::TestCase
  setup do
    @account_receivable = account_receivables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_receivables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_receivable" do
    assert_difference('AccountReceivable.count') do
      post :create, account_receivable: { cost_center_id: @account_receivable.cost_center_id, data_vencimento: @account_receivable.data_vencimento, documento: @account_receivable.documento, observacao: @account_receivable.observacao, payment_method_id: @account_receivable.payment_method_id, supplier_id: @account_receivable.supplier_id, type_account: @account_receivable.type_account, valor: @account_receivable.valor }
    end

    assert_redirected_to account_receivable_path(assigns(:account_receivable))
  end

  test "should show account_receivable" do
    get :show, id: @account_receivable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_receivable
    assert_response :success
  end

  test "should update account_receivable" do
    patch :update, id: @account_receivable, account_receivable: { cost_center_id: @account_receivable.cost_center_id, data_vencimento: @account_receivable.data_vencimento, documento: @account_receivable.documento, observacao: @account_receivable.observacao, payment_method_id: @account_receivable.payment_method_id, supplier_id: @account_receivable.supplier_id, type_account: @account_receivable.type_account, valor: @account_receivable.valor }
    assert_redirected_to account_receivable_path(assigns(:account_receivable))
  end

  test "should destroy account_receivable" do
    assert_difference('AccountReceivable.count', -1) do
      delete :destroy, id: @account_receivable
    end

    assert_redirected_to account_receivables_path
  end
end
