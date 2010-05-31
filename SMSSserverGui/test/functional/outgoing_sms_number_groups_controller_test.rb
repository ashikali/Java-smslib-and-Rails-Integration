require 'test_helper'

class OutgoingSmsNumberGroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outgoing_sms_number_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outgoing_sms_number_group" do
    assert_difference('OutgoingSmsNumberGroup.count') do
      post :create, :outgoing_sms_number_group => { }
    end

    assert_redirected_to outgoing_sms_number_group_path(assigns(:outgoing_sms_number_group))
  end

  test "should show outgoing_sms_number_group" do
    get :show, :id => outgoing_sms_number_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => outgoing_sms_number_groups(:one).to_param
    assert_response :success
  end

  test "should update outgoing_sms_number_group" do
    put :update, :id => outgoing_sms_number_groups(:one).to_param, :outgoing_sms_number_group => { }
    assert_redirected_to outgoing_sms_number_group_path(assigns(:outgoing_sms_number_group))
  end

  test "should destroy outgoing_sms_number_group" do
    assert_difference('OutgoingSmsNumberGroup.count', -1) do
      delete :destroy, :id => outgoing_sms_number_groups(:one).to_param
    end

    assert_redirected_to outgoing_sms_number_groups_path
  end
end
