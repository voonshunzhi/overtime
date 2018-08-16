require 'rails_helper'

RSpec.feature "Posts", type: :feature do
    describe "index " do
        scenario "visit index page" do
              visit posts_path
              expect(page.status_code).to eq 200
        end
        
        scenario "visit root path and should have title post" do
              visit posts_path
              expect(page).to have_content("Posts")
         end
    end
  
    describe "creation" do
        before do
            @user = User.create(email:"hello@gmail.com",password:"password",first_name:"Jorden",last_name:"Hudgens",username:"Jorden")
            login_as(@user)
            visit new_post_path
        end
        scenario "has a new form that can be reached" do
            expect(page.status_code).to eq 200
        end
        
        scenario "can be created from new form page" do
            fill_in "post[date]",with: Date.today
            fill_in "post[rationale]",with: "some rationale"
            click_button "Save"
            
            expect(page).to have_content("some rationale")
        end
    end
  
  
end
