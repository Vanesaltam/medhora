require "test_helper"

class MedicosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medicos_index_url
    assert_response :success
  end

  test "should get show" do
    get medicos_show_url
    assert_response :success
  end
end
