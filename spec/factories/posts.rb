FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some rationale"
    user
    overtime_request 3.5
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Additional content for the new rationale in the second post"
    user
    overtime_request 0.5
  end
end