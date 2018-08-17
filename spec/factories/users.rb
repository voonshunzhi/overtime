FactoryGirl.define do
    sequence :email do |n|
        "person#{n}@example.com" 
    end
    
   factory :user do
       first_name "James"
       last_name "Wong01"
       email { generate :email}
       password "password"
       password_confirmation "password"
   end
   
   factory :second_user,class:"User" do
       first_name "James"
       last_name "Wang99"
       email "wang@gmail.com"
       password "password"
       password_confirmation "password"
   end
   
   factory :admin_post,class:"AdminUser" do
       first_name "Voon"
       last_name "Shun Zhi"
       email "voon@gmail.com"
       password "password"
       password_confirmation "password"
   end
end