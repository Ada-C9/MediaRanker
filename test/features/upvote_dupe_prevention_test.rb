require "test_helper"

feature "upvote duplication prevention" do
  scenario "user should not be able to upvote same work twice" do
    work = Work.create!(category: "album", title: "Dark Side of the Moon")

    login_as "Bob"

    click_on "Dark Side of the Moon"
    click_on "Upvote"
    page.must_have_content("Successfully upvoted!")

    click_on "Upvote"

    # binding.pry
    # page.text
    # page.html

    page.must_have_content("You cannot vote for same work twice.")
  end

  def login_as(name)
    visit root_path
    click_on "Login"
    fill_in "Username", with: name
    click_on "Create User"
  end
end
