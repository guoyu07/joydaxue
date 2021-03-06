# == Schema Information
#
# Table name: schools
#
#  id               :integer          not null, primary key
#  province_id      :integer          not null
#  city_id          :integer          not null
#  name             :string(255)      not null
#  address          :string(255)
#  college_type     :string(255)
#  telephone        :string(255)
#  avatar           :string(255)
#  website          :string(255)
#  found_year       :string(255)
#  zipcode          :string(255)
#  affiliate        :string(255)
#  latitude         :decimal(10, 6)   default(0.0)
#  longitude        :decimal(10, 6)   default(0.0)
#  is_211           :boolean          default(FALSE)
#  is_985           :boolean          default(FALSE)
#  is_edu_affiliate :boolean          default(FALSE)
#  has_bachelor     :boolean          default(FALSE)
#  is_independent   :boolean          default(FALSE)
#  is_civilian_run  :boolean          default(FALSE)
#  key_disciplines  :integer          default(0)
#  master_num       :integer          default(0)
#  phd_num          :integer          default(0)
#  academician_num  :integer          default(0)
#  created_at       :datetime
#  updated_at       :datetime
#

FactoryGirl.define do
  factory :school do
    id 1
    province_id 1
    city_id 1
    name "南通大学"
    website "http://www.ntu.edu.cn"
    found_year "2004"
    address "江苏省南通市啬园路9号"
  end
end
