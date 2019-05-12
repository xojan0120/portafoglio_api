module Api
  module V1
    class JudgmentsController < ApplicationController
      before_action :authenticate

      def show
        if params[:site_id]
          judge_site
        else
          judge_user
        end
      end

      private

        def judge_site
          site = Site.find_by(id: params[:site_id])

          if site.user.uid == params[:uid]
            render status: 200, json: { message: 'success', result: true }
          else
            render status: 200, json: { message: 'success', result: false }
          end
        end

        def judge_user
          authenticate_with_http_token do |token, options|
            decoded_token = FirebaseHelper::Auth.verify_id_token(token)
            if decoded_token['uid'] == params[:uid]
              render status: 200, json: { message: 'success', result: true }
            else
              render status: 200, json: { message: 'success', result: false }
            end
          end
        end
    end
  end
end
