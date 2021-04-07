require 'rails_helper'

RSpec.describe User, type: :model do

    subject(:good_user) {User.create!(username: "goalie", password: "password123")}
    # describe "user validations" do  
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:session_token) }
        it { should validate_length_of(:password).is_at_least(6) }
       
    # end
    
    # describe 'uniqueness' do 
    #     before(:each) do 
    #         create(:user)
    #     end
        it { should validate_uniqueness_of(:session_token)}
        it { should validate_uniqueness_of(:username)}

    # end

    describe "user#self.find_by_credentials" do
        before { good_user.save! }
        it "Finds user with valid credentials" do
            expect(User.find_by_credentials("goalie", "password123")).to eq(good_user)
        end
        it "Does not find user if credentials do not exist" do
            expect(User.find_by_credentials("timothy", "password123")).to eq(nil)
        end
    end

end