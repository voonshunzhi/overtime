require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
      before do
          @user = User.create(email:"voonshunzhi@gmail.com",password:"password",first_name:"Jon",last_name:"Dorenbos")
      end
      it "can be created" do
          expect(@user).to be_valid
      end
      
      it "cannot be created without firstname and lastname" do
          @user.first_name = nil;
          @user.last_name = nil;
          expect(@user).not_to be_valid
      end
  end
end
