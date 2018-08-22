# frozen_string_literal: true

FactoryBot.define do
  factory :apology do
    sequence(:body) { |n| "body content #{n}" }
    sequence(:image) { |n| "imagefilename#{n}.jpg" }
  end
end
