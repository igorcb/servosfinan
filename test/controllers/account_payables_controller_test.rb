require 'test_helper'

class AccountPayablesControllerTest < ActionController::TestCase
  setup do
    @account_payable = account_payables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_payables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_payable" do
    assert_difference('AccountPayable.count') do
      post :create, account_payable: { cost_center_id: @account_payable.cost_center_id, data_vencimento: @account_payable.data_vencimento, documento: @account_payable.documento, observacao: @account_payable.observacao, payment_method_id: @account_payable.payment_method_id, supplier_id: @account_payable.supplier_id, type_account: @account_payable.type_account, valor: @account_payable.valor }
    end

    assert_redirected_to account_payable_path(assigns(:account_payable))
  end

  test "should show account_payable" do
    get :show, id: @account_payable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_payable
    assert_response :success
  end

  test "should update account_payable" do
    patch :update, id: @account_payable, account_payable: { cost_center_id: @account_payable.cost_center_id, data_vencimento: @account_payable.data_vencimento, documento: @account_payable.documento, observacao: @account_payable.observacao, payment_method_id: @account_payable.payment_method_id, supplier_id: @account_payable.supplier_id, type_account: @account_payable.type_account, valor: @account_payable.valor }
    assert_redirected_to account_payable_path(assigns(:account_payable))
  end

  test "should destroy account_payable" do
    assert_difference('AccountPayable.count', -1) do
      delete :destroy, id: @account_payable
    end

    assert_redirected_to account_payables_path
  end
end
