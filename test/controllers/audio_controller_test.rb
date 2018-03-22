require 'test_helper'

class AudioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get audio_index_url
    assert_response :success
  end

  test "should get new" do
    get audio_new_url
    assert_response :success
  end

  test "should get edit" do
    get audio_edit_url
    assert_response :success
  end

  test "should get show" do
    get audio_show_url
    assert_response :success
  end

end
