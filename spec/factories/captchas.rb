# == Schema Information
#
# Table name: captchas
#
#  id           :integer          not null, primary key
#  captcha_type :string(255)      not null
#  mobile       :string(255)      not null
#  send_count   :integer          default(0)
#  code         :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :captcha do
    id 1
    captcha_type "signin"
    mobile "15026612137"
    send_count 1
    code "1234"
  end
end
