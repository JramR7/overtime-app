require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end


    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without number" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do
    it "has full_name method to combine names" do
      expect(@user.full_name).to eq("#{@user.first_name.upcase} #{@user.last_name.upcase}")
    end
  end
end
