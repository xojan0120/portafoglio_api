module Api
  module V1
    class ScreenshotsController < ApplicationController
      before_action :authenticate, only: [:create, :destroy]

      def show
        if site = Site.find_by(id: params[:site_id])
          render status: 200, json: { message: 'success' , screenshot: site.screenshot }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

      def create
        site = Site.find_by(id: params[:site_id])
        if site.update(screenshot: params[:screenshot])
          render status: 200, json: { message: 'success' }
        else
          render status: 422, json: { message: site.errors.full_messages.join(", ") }
        end
      end

      def destroy
        site = Site.find_by(id: params[:site_id])
        if site.update(screenshot: nil)
          render status: 200, json: { message: 'success' }
        else
          render status: 422, json: { message: site.errors.full_messages.join(", ") }
        end
      end
    end
  end
end
