# frozen_string_literal: true

require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test 'home nav item' do
    get root_url

    assert_select '.nav>.nav-item>.nav-link', 'Home'
    assert_select '.nav>.nav-item>.nav-link>.fa-solid.fa-house'
  end

  test 'users nav item' do
    get root_url

    assert_select '.nav>.nav-item:nth-child(2)', 'Users'
    assert_select '.nav>.nav-item:nth-child(2) .fa-solid.fa-users'
  end

  test 'tasks nav item' do
    get root_url

    assert_select '.nav>.nav-item:nth-child(3)', 'Tasks'
    assert_select '.nav>.nav-item:nth-child(3) .fa-solid.fa-list-check'
  end
end
