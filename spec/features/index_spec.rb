require 'spec_helper'

feature "Testing infrastructure" do
  scenario "Home page contains text: 'This is the index page" do
    visit "/"
    expect(page).to have_text "Welcome to the index..."
  end
end
