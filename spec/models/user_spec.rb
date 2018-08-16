require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @user = User.create(email:"voonshunzhi@gmail.com",password:"password",first_name:"Jon",last_name:"Dorenbos")
      login_as(@user, :scope => :user)
  end
  
  describe "creation" do
      it "can be created" do
          expect(@user).to be_valid
      end
      
      it "cannot be created without firstname and lastname" do
          @user.first_name = nil;
          @user.last_name = nil;
          expect(@user).not_to be_valid
      end
      
  end
  
  describe "custom name methods" do
    it "has a full name method that combine the first name and last name" do
      expect(@user.full_name).to eq "Jon Dorenbos"
    end
  end
end
