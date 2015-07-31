require 'test_helper'

class TemplateParametersControllerTest < ActionController::TestCase
  setup do
    @template_parameter = template_parameters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:template_parameters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create template_parameter" do
    assert_difference('TemplateParameter.count') do
      post :create, template_parameter: { atom: @template_parameter.atom, name: @template_parameter.name, type: @template_parameter.type, value: @template_parameter.value }
    end

    assert_redirected_to template_parameter_path(assigns(:template_parameter))
  end

  test "should show template_parameter" do
    get :show, id: @template_parameter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @template_parameter
    assert_response :success
  end

  test "should update template_parameter" do
    patch :update, id: @template_parameter, template_parameter: { atom: @template_parameter.atom, name: @template_parameter.name, type: @template_parameter.type, value: @template_parameter.value }
    assert_redirected_to template_parameter_path(assigns(:template_parameter))
  end

  test "should destroy template_parameter" do
    assert_difference('TemplateParameter.count', -1) do
      delete :destroy, id: @template_parameter
    end

    assert_redirected_to template_parameters_path
  end
end
