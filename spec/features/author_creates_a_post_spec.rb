require 'rails_helper'

feature 'When an author creates a post' do
  scenario 'they see the post on the edit page' do
    user = FactoryGirl.create(:author_user)
    login_as(user, :scope => :author_user)

    visit forgecms.new_post_path

    fill_in 'post_title', with: 'My First Post'
    fill_in 'post_body', with: '<p>Hello, world.</p>'
    click_button '.submit'

    expect(page).to have_css '.edit'
  end
end