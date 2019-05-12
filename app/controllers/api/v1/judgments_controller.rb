module Api
  module V1
    class JudgmentsController < ApplicationController
      before_action :authenticate

      def show
        site = Site.find_by(id: params[:site_id])

        if site.user.uid == params[:uid]
          render status: 200, json: { message: 'success', result: true }
        else
          render status: 200, json: { message: 'success', result: false }
        end
      end
    end
  end
end
