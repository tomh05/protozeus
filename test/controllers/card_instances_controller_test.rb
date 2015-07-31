require 'test_helper'

class CardInstancesControllerTest < ActionController::TestCase
  setup do
    @card_instance = card_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_instance" do
    assert_difference('CardInstance.count') do
      post :create, card_instance: { card_id: @card_instance.card_id }
    end

    assert_redirected_to card_instance_path(assigns(:card_instance))
  end

  test "should show card_instance" do
    get :show, id: @card_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_instance
    assert_response :success
  end

  test "should update card_instance" do
    patch :update, id: @card_instance, card_instance: { card_id: @card_instance.card_id }
    assert_redirected_to card_instance_path(assigns(:card_instance))
  end

  test "should destroy card_instance" do
    assert_difference('CardInstance.count', -1) do
      delete :destroy, id: @card_instance
    end

    assert_redirected_to card_instances_path
  end
end
