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

    describe "password encryption" do 
        it "does not save password to the database" do 
            FactoryBot.create(:coolest_user)
            user = User.find_by(username: 'coolest_user')
            expect(user.password).not_to eq('password123')
        end

        it "encrypts password using bcrypt" do 
            expect(BCrypt::Password).to receive(:create).with('asdlfkju')
            FactoryBot.build(:coolest_user, password: 'asdlfkju')
        end
    end
    
    describe "#is_password?" do 
        let(:user) {create(:user)}
        context 'with correct password' do 
            it 'should return true' do 
                expect(user.is_password?("password123")).to be true
            end
        end

        context 'with incorrect password' do 
            it 'should return false' do 
                expect(user.is_password?("password")).to be false
            end
        end
    end
end