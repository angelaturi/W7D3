FactoryBot.define do 
    factory :user do 
        username {Faker::FunnyName.name}
        password {'password123'}

        factory :coolest_user do 
            username {'coolest_user'}
        end
    end
end