require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test@test.com", password: "testing1234",
      password_confirmation: "testing1234",first_name: "jose", last_name:"Ramirez")
    login_as(@user, :scope => :user)
    visit new_post_path
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has posts title' do
      expect(page).to have_content(/Posts/)
    end

    it 'has list of posts' do
      post1 = Post.create(date: Date.today, rationale: "Post1", user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "Post2", user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do        
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'some rationale'
      click_on 'Save'

      expect(page).to have_content("some rationale")
    end

    it 'will have a user associated to it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("User association")
    end
  end
end