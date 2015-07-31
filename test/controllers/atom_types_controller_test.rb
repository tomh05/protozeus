require 'test_helper'

class AtomTypesControllerTest < ActionController::TestCase
  setup do
    @atom_type = atom_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atom_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atom_type" do
    assert_difference('AtomType.count') do
      post :create, atom_type: { name: @atom_type.name }
    end

    assert_redirected_to atom_type_path(assigns(:atom_type))
  end

  test "should show atom_type" do
    get :show, id: @atom_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atom_type
    assert_response :success
  end

  test "should update atom_type" do
    patch :update, id: @atom_type, atom_type: { name: @atom_type.name }
    assert_redirected_to atom_type_path(assigns(:atom_type))
  end

  test "should destroy atom_type" do
    assert_difference('AtomType.count', -1) do
      delete :destroy, id: @atom_type
    end

    assert_redirected_to atom_types_path
  end
end
