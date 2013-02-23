
FactoryGirl.define do
  factory :widget, :class => Refinery::Widgets::Widget do
    sequence(:name) { |n| "refinery#{n}" }
    sequence(:content) { |n| "<em>refinery</em><strong>#{n}<strong>" }
  end
end

