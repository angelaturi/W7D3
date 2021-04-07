require 'rails_helper'

RSpec.describe User, type: :model do

    # subject(:good_user) {User.create!(username: "goalie", password: "password123")}
    # describe "user validations" do  
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:session_token) }
        it { should validate_length_of(:password).is_at_least(6) }
       
    # end
    
    describe 'uniqueness' do 
        before(:each) do 
            create(:user)
        end
        it { should validate_uniqueness_of(:session_token)}
        it { should validate_uniqueness_of(:username)}

    end

end