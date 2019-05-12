module Api
  module V1
    class ViewsController < ApplicationController
      def index
        view = View.find_by(id: params[:site_id])

        if view
          render status: 200, json: { message: 'success', view: view.count }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

      def create
        view = View.create_with(count: 0).find_by(id: params[:site_id])

        if view.update(count: view.count + 1)
          render status: 200, json: { message: 'success', view: view.count }
        else
          render status: 422, json: { message: reaction.errors.full_messages.join(", ") }
        end
      end
    end
  end
end
