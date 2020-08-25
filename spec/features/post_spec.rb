require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
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
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/rationale/)
    end
  end

  describe 'new post' do
    it 'has a link from homepage' do
      visit root_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
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

  describe 'edit posts' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content("Edited content")
    end
  end
end