module Api
  module V1
    class ReactionsController < ApplicationController
      before_action :authenticate, only: [:create, :destroy]
      def index
        reactions = Hash.new
        if counts = Site.find_by(id: params[:site_id])&.site_reactions&.group(:reaction)&.count
          counts.each do |reaction, value|
            reactions[reaction.name] = value
          end
        end

        if reactions.any?
          render status: 200, json: { message: 'success', reactions: reactions }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

      def create
        reaction = SiteReaction.new(
          site:         Site.find_by(id:   params[:site_id]),
          reaction: Reaction.find_by(name: params[:reaction]),
          user:         User.find_by(uid:  params[:uid])
        )

        if reaction.save
          render status: 200, json: { message: 'success', count: getCount(params[:site_id], params[:reaction]) }
        else
          render status: 422, json: { message: reaction.errors.full_messages.join(", ") }
        end
      end

      def destroy
        reaction = SiteReaction.find_by(
          site:         Site.find_by(id:   params[:site_id]),
          reaction: Reaction.find_by(name: params[:reaction]),
          user:         User.find_by(uid:  params[:uid])
        )

        if reaction.destroy
          render status: 200, json: { message: 'success', count: getCount(params[:site_id], params[:reaction]) }
        else
          render status: 422, json: { message: reaction.errors.full_messages.join(", ") }
        end
      end

      private

        def getCount(site_id, name)
          Site.find(site_id).reactions.where(name: name).count
        end
    end
  end
end
