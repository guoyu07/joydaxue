# == Schema Information
#
# Table name: favorites 用户收藏
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null  用户 ID
#  detail_type :string(191)                收藏数据的类型
#  detail_id   :integer          not null  收藏数据的 ID
#  created_at  :datetime
#  updated_at  :datetime

class Favorite < ActiveRecord::Base
  belongs_to :user

  class << self

    def collect(user_id, favorite_id)
      detail_type = favorite_id.split(":")[0]
      detail_id = favorite_id.split(":")[1]
      favorite = where(user_id: user_id, detail_type: detail_type,
        detail_id: detail_id).first
      favorite || create(user_id: user_id, detail_type: detail_type,
        detail_id: detail_id)
    end

    def uncollect(user_id, favorite_id)
      detail_type = favorite_id.to_s.split(":")[0]
      detail_id = favorite_id.to_s.split(":")[1]
      where(user_id: user_id, detail_id: detail_id,
        detail_type: detail_type).delete_all
    end

  end

end