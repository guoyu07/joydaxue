# -*- coding: utf-8 -*-

module Xinge
  class Ios < Base

    class << self

      def push_to_single_device(device_token, title, content)
        push_single_device(device_token, build_simple_message(title, content),
          environment_param)
      end

      protected

      def environment_param
        { environment: 1 }
      end

      def build_simple_message(title, content)
        {
          aps: {
            alert: {
              title: title,
              body: content
            },
            sound: 'default',
            badge: 1
          }
        }.to_json
      end

    end

  end
end