# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class CommentsTest < ApplicationSystemTestCase
  def setup
    @post = posts(:one)
    @post_without_comments = posts(:without_comments)
    @comment = @post.comments.first
  end

  test 'shows comments' do
    visit post_path(@post)

    assert_selector 'h3', text: 'Comments'
    assert_selector 'small', text: @post.comments.first.body
  end

  test 'shows create comment form' do
    visit post_path(@post)

    assert_selector 'textarea#post_comment_body'
    assert_selector 'input[value="Create Comment"]'
  end

  test 'creates comment' do
    visit post_path(@post_without_comments)

    find('textarea#post_comment_body').set('New Comment')
    click_button('Create Comment')

    assert_text 'Comment was successfully created.'
    assert_selector 'small', text: 'New Comment'
  end

  test 'edits comment' do
    visit post_path(@post)

    page.find('div.card', text: @comment.body).click_link('Edit')
    assert_selector 'h1', text: 'Editing comment'

    fill_in 'Body', with: 'Edited comment'
    click_button 'Update Comment'

    assert_text 'Comment was successfully updated.'
    assert_no_selector 'div.card', text: @comment.body
    assert_selector 'div.card', text:'Edited comment'
  end

  test 'destroys comment' do
    visit post_path(@post)

    page.accept_confirm do
      page.find('div.card', text: @post.comments.first.body).click_link('Delete')
    end

    assert_no_selector 'div.card', text: @post.comments.first.body 
  end
end