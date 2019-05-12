module Api
  module V1
    class ReactionCheckerController < ApplicationController
      before_action :authenticate, only: :show

      def show
        reaction = SiteReaction.find_by(
          site:         Site.find_by(id:   params[:site_id]),
          reaction: Reaction.find_by(name: params[:reaction_name]),
          user:         User.find_by(uid:  params[:uid])
        )

        if reaction
          render status: 200, json: { message: 'success' }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end
    end
  end
end
