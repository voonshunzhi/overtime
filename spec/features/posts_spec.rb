require 'rails_helper'

RSpec.feature "Posts", type: :feature do
    describe "index " do
        before do
            @user = FactoryGirl.create(:second_user)
            login_as(@user)
            visit posts_path
        end
        
        scenario "visit index page" do
              expect(page.status_code).to eq 200
        end
        
        scenario "visit root path and should have title post" do
              expect(page).to have_content(/Posts/)
         end
         
         scenario "it has a lists of posts" do
             post1 = FactoryGirl.create(:post)
             post2 = FactoryGirl.create(:second_post)
             visit posts_path
             expect(page).to have_content(/Some Rationale|Yesterday rationale/)
         end
    end
  
    describe "creation" do
        before do
            @user = FactoryGirl.create(:second_user)
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
    
    describe "edit" do
        before do
            @user = FactoryGirl.create(:second_user)
            login_as(@user)
            @post = FactoryGirl.create(:post)
        end
        it "can be reached" do
            
            visit posts_path
            
            click_link("edit_#{@post.id}")
            expect(page.status_code).to eq 200
        end
        
        it "can be edited" do
            visit edit_post_path(@post)
            
            fill_in "post[date]",with: Date.tomorrow
            fill_in "post[rationale]",with: "Edited content"
            
            click_on "Save"
            
            expect(page).to have_content "Edited content"
        end
    end
  
  
end
