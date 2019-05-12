module Api
  module V1
    class SiteCheckerController < ApplicationController
      def show
        if Site.find_by(id: params[:site_id])
          render status: 200, json: { message: 'success' }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end
    end
  end
end
