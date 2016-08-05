FactoryGirl.define do
  factory :message do
    chatroom nil
    user "MyString"
    content "MyText"
  end
  factory :chatroom do
    name "MyString"
  end
end
