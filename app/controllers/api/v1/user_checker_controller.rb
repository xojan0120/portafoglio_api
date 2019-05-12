module Api
  module V1
    class UserCheckerController < ApplicationController
      def show
        if User.find_by(uid: params[:uid])
          render status: 200, json: { message: 'success' }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end
    end
  end
end
