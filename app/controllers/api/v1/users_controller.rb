module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate, only: [:update]

      def show
        user = User.find_by(uid: params[:uid])

        if user
          render status: 200, json: { message: 'success', nickname: user.nickname }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

      def update
        user = User.find_by(uid: params[:uid])

        if user
          user.update(nickname: params[:nickname])
          render status: 200, json: { message: 'success' }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end
    end
  end
end
