FactoryGirl.define do
  factory :review do |r|
        r.review_summary 'Test Review'
        r.review_text 'A Review'
        r.star_rating '5'
  end
end