# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    user nil
    what_worked_well "MyText"
    what_needs_improvement "MyText"
    comments "MyText"
  end
end
