require 'test_helper'

class MicropotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropot = micropots(:one)
  end

  test "should get index" do
    get micropots_url
    assert_response :success
  end

  test "should get new" do
    get new_micropot_url
    assert_response :success
  end

  test "should create micropot" do
    assert_difference('Micropot.count') do
      post micropots_url, params: { micropot: { content: @micropot.content, user_id: @micropot.user_id } }
    end

    assert_redirected_to micropot_url(Micropot.last)
  end

  test "should show micropot" do
    get micropot_url(@micropot)
    assert_response :success
  end

  test "should get edit" do
    get edit_micropot_url(@micropot)
    assert_response :success
  end

  test "should update micropot" do
    patch micropot_url(@micropot), params: { micropot: { content: @micropot.content, user_id: @micropot.user_id } }
    assert_redirected_to micropot_url(@micropot)
  end

  test "should destroy micropot" do
    assert_difference('Micropot.count', -1) do
      delete micropot_url(@micropot)
    end

    assert_redirected_to micropots_url
  end
end
