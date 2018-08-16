require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
      before do
          @user = User.create(email:"voonshunzhi@gmail.com",password:"password",first_name:"Jon",last_name:"Dorenbos")
          login_as(user, :scope => :user)
      end
      it "can be created" do
          expect(@user).to be_valid
      end
      
      it "cannot be created without firstname and lastname" do
          @user.first_name = nil;
          @user.last_name = nil;
          expect(@user).not_to be_valid
      end
      
      it "will have user associated with post" do
        fill_in "post[date]",with: Date.today
        fill_in "post[rationale]",with:"What is the rationale"
        click_button "Create"
        
        expect(User.last.posts.last.rationale).to eq "What is the rationale"
      end
  end
end
