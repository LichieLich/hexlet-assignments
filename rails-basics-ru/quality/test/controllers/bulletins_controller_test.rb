require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins page' do
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
    assert_select 'li', bulletins(:bulletin_one).title
    assert_select 'li', bulletins(:bulletin_two).title
  end

  test 'opens single bulletin' do
    get bulletin_path(bulletins(:bulletin_two))
    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'h2', bulletins(:bulletin_two).title
    assert_select 'p', text: bulletins(:bulletin_two).body
    assert_select 'p', text: bulletins(:bulletin_two).published
  end
end