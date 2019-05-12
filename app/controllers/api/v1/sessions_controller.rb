module Api
  module V1
    class SessionsController < ApplicationController
      def save
        session['uid'] = 'john'
        cookies['uid'] = 'smith'
        render status: 200, json: { message: 'save' }
      end

      def load 
        render status: 200, json: { message: "load: #{session['uid']}, cookie: #{cookies['uid']}" }
      end
    end
  end
end
