require 'test_helper'

class OutgoingSmsContentGroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outgoing_sms_content_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outgoing_sms_content_group" do
    assert_difference('OutgoingSmsContentGroup.count') do
      post :create, :outgoing_sms_content_group => { }
    end

    assert_redirected_to outgoing_sms_content_group_path(assigns(:outgoing_sms_content_group))
  end

  test "should show outgoing_sms_content_group" do
    get :show, :id => outgoing_sms_content_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => outgoing_sms_content_groups(:one).to_param
    assert_response :success
  end

  test "should update outgoing_sms_content_group" do
    put :update, :id => outgoing_sms_content_groups(:one).to_param, :outgoing_sms_content_group => { }
    assert_redirected_to outgoing_sms_content_group_path(assigns(:outgoing_sms_content_group))
  end

  test "should destroy outgoing_sms_content_group" do
    assert_difference('OutgoingSmsContentGroup.count', -1) do
      delete :destroy, :id => outgoing_sms_content_groups(:one).to_param
    end

    assert_redirected_to outgoing_sms_content_groups_path
  end
end
