# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  def setup
    @post = posts(:one)
  end

  test 'visiting the index' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'
  end

  test 'shows post' do
    visit post_path(@post)

    assert_selector 'h1', text: @post.title
    assert_selector 'strong', text: 'Body:'
    assert_selector 'p', text: @post.body
  end

  test 'visiting new post' do
    visit new_post_path
    assert_selector 'h1', text: 'New post'
  end

  test 'creates post without body' do
    visit new_post_path

    fill_in 'Title', with: 'New Post'
    click_button('Create Post')

    assert_text 'Post was successfully created.'
  end

  test 'creates post with body' do
    visit new_post_path

    fill_in 'Title', with: 'New Post'
    fill_in 'Body', with: 'It is s a body'
    click_button('Create Post')

    assert_text 'Post was successfully created.'
  end

  test 'visiting edit post' do
    visit edit_post_path(@post)
    assert_selector 'h1', text: 'Editing post'
  end

  test 'updates post title' do
    visit edit_post_path(@post)

    fill_in 'Title', with: 'Edited Post'
    click_button('Update Post')

    assert_text 'Post was successfully updated.'
  end

  test 'updates whole post' do
    visit edit_post_path(@post)

    fill_in 'Title', with: 'Edited Post'
    fill_in 'Body', with: 'Edited Body'
    click_button('Update Post')

    assert_text 'Post was successfully updated.'
  end

  test 'destroys post' do
    visit posts_path

    page.accept_confirm do
      page.find('tr', text: @post.title).click_on('Destroy')
    end

    assert_text 'Post was successfully destroyed.'
  end
end
# END
