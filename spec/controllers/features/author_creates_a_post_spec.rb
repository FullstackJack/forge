require 'rails_helper'

feature 'Author creates a post' do
  scenario 'they see the post on the edit page' do
    visit forgecms.new_post_path

    fill_in
    expect(page).to have_css '.post'
  end
end