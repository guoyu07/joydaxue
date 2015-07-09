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

      desc '用户注册接口'
      params do
        optional :cellphone, type: String, desc: "用户的手机号"
        optional :code, type: String, desc: "手机短信的验证码"
        optional :password, type: String, desc: "用户密码, 6至16位字符"
      end

      post '/signup' do
        result, content = V1::UserService.signup(params)
        if result
          render_json(data: content)
        else
          render_error(content)
        end
      end

      desc '用户登录接口'
      params do
        optional :cellphone, type: String, desc: "用户的手机号"
        optional :password, type: String, desc: "用户密码, 6至16位字符"
      end

      post '/signin' do
        result, content = V1::UserService.signin(params)
        if result
          render_json(data: content)
        else
          render_error(content)
        end
      end

      desc '更新用户资料接口'
      params do
        optional :token, type: String, desc: "用户的唯一标识型"
        optional :name, type: String, desc: "用户的名称，不能重复"
        optional :sex, type: String, desc: "用户的性别，0为女，1为男"
      end

      post '/update_profile' do
        validate_user_token
        result, content = V1::UserService.update_profile(params)
        if result
          render_json(data: content)
        else
          render_error(content)
        end
      end

      desc ' 用户忘记密码接口'
      params do
        optional :cellphone, type: String, desc: "用户的手机号"
      end

      post '/forgot_password' do
        result, content = V1::UserService.forgot_password(params[:cellphone])
        if result
          render_json(data: content)
        else
          render_error(content)
        end
      end

      desc '用户修改密码接口'
      params do
        optional :cellphone, type: String, desc: "用户的手机号"
        optional :code, type: String, desc: "手机短信的验证码"
        optional :password, type: String, desc: "用户密码, 6至16位字符"
        optional :confirm_password, type: String, desc: "用户确认密码, 6至16位字符"
      end

      post '/reset_password' do
        result, content = V1::UserService.reset_password(params)
        if result
          render_json(data: content)
        else
          render_error(content)
        end
      end

    end
  end
end
