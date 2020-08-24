FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some rationale"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Additional content for the new rationale in the second post"
    user
  end
end