# -*- coding: utf-8 -*-

module V1
  class UserApi < BaseApi
    resource :users do

      desc '获取用户的个人数据'
      params do
        optional :id, type: Integer, desc: "Topic ID"
        optional :token, type: String, desc: "用户的唯一标识"
      end

      get '/:id' do
        parse_user_token
        result, content = V1::UserService.get_user_detail(params)
        if result
          render_or_cache(data: content)
        else
          render_error(content)
        end
      end

      desc ' 发送用户注册验证码接口'
      params do
        optional :cellphone, type: String, desc: "用户的手机号"
      end

      post '/send_captcha' do
        result, content = V1::UserService.send_captcha(params[:cellphone])
        if result
          render_json(data: content)
        else
          render_error(content)
        end
      end

    end
  end
end
