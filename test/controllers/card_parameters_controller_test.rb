require 'test_helper'

class CardParametersControllerTest < ActionController::TestCase
  setup do
    @card_parameter = card_parameters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_parameters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_parameter" do
    assert_difference('CardParameter.count') do
      post :create, card_parameter: { name: @card_parameter.name, value: @card_parameter.value }
    end

    assert_redirected_to card_parameter_path(assigns(:card_parameter))
  end

  test "should show card_parameter" do
    get :show, id: @card_parameter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_parameter
    assert_response :success
  end

  test "should update card_parameter" do
    patch :update, id: @card_parameter, card_parameter: { name: @card_parameter.name, value: @card_parameter.value }
    assert_redirected_to card_parameter_path(assigns(:card_parameter))
  end

  test "should destroy card_parameter" do
    assert_difference('CardParameter.count', -1) do
      delete :destroy, id: @card_parameter
    end

    assert_redirected_to card_parameters_path
  end
end
