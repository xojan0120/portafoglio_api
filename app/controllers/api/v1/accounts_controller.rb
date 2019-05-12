module Api
  module V1
    class AccountsController < ApplicationController
      before_action :authenticate, only: [:create, :destroy]

      def create
        authenticate_with_http_token do |token, options|
          decoded_token = FirebaseHelper::Auth.verify_id_token(token)
          user = User.new(
            nickname: decoded_token['decoded_token'][:payload]['name'],
            uid:      decoded_token['uid']
          )
          if user.save
            render status: 200, json: { message: 'success' }
          else
            logger.error user.errors.full_messages
            render status: 422, json: { message: user.errors.full_messages.join(", ") }
          end
        end
      end

      def destroy
        user = User.find_by(uid: params[:uid])

        if user
          user.destroy
          render status: 200, json: { message: 'success' }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

    end
  end
end
