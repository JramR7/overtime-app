require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test@test.com", password: "testing1234", password_confirmation: "testing1234",
        first_name: "jose", last_name:"Ramirez")
      @post = Post.create(date: Date.today, rationale: "Anything", user_id: @user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without date and rationale" do
      @post.date = nil
      @post.rationale = nil

      expect(@post).to_not be_valid
    end
  end
end
