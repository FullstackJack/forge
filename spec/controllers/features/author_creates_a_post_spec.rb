require 'rails_helper'

feature 'Author creates a post' do
  scenario 'they see the post on the edit page' do
    visit forgecms.new_post_path

    fill_in 'title', with: 'My First Post'
    fill_in 'body', with: '<p>Hello, world.</p>'
    click_button '.submit'

    expect(page).to have_css '.post'
  end
end