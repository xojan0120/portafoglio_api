module Api
  module V1
    class SitesController < ApplicationController
      before_action :authenticate, only: [:update, :create, :destroy]
      
      def index
        page = params[:page].to_i
        page <= 0 ? page = 0 : page -= 1
        pos = page * Settings.per_page

        sites = nil
        if params[:uid]
          user  = User.find_by(uid: params[:uid])
          sites = Site.where(user: user).offset(pos).limit(Settings.per_page)
        else
          sites = Site.offset(pos).limit(Settings.per_page)
        end

        if sites.any?
          render status: 200, json: { message: 'success', list: sites }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

      def show
        info = Hash.new

        if site = Site.find_by(id: params[:site_id])
          unit       = site.creation_period_unit.name
          skills     = site.skills.map {|skill| { value: skill.name, label: skill.name } }
          updated_at = site.updated_at.strftime("%Y/%m/%d")

          info = { 
            owner:      site.user.nickname,
            siteName:   site.name,
            siteUrl:    site.url,
            period:     site.creation_period,
            periodUnit: unit,
            usedSkills: skills,
            comment:    site.comment,
            updateAt:   updated_at
          }
        end

        if info.any?
          render status: 200, json: { message: 'success', siteInfo: info }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

      def update
        site = Site.find_by(id: params[:site_id])
        if site
          if site.update_attributes(site_params)
            render status: 200, json: { message: 'success' }
          else
            render status: 422, json: { message: site.errors.full_messages.join(", ") }
          end
        else
          render status: 404, json: { message: 'Not found' }
        end
      end

      def create
        site = Site.new(site_params)
        site.user = User.find_by(uid: params[:uid])

        if site.save
          render status: 200, json: { message: 'success', siteId: site.id }
        else
          render status: 422, json: { message: site.errors.full_messages.join(", ") }
        end
      end

      def destroy
        site = Site.find_by(id: params[:site_id])
        if site.destroy
          render status: 200, json: { message: 'success' }
        else
          render status: 422, json: { message: reaction.errors.full_messages.join(", ") }
        end
      end

      private

        def site_params
          skills = params[:usedSkills].inject([]) do |arr, usedSkill|
            arr << Skill.find_or_create_by(name: usedSkill[:value])
            arr
          end
          
          info = {
              name:                    params[:siteName],
              url:                     params[:siteUrl],
              creation_period:         params[:period],
              creation_period_unit_id: Unit.find_by(name: params[:periodUnit]).id,
              comment:                 params[:comment],
              skills:                  skills
          }

          if params[:screenshot]
            info[:screenshot] = params[:screenshot]
          end

          info
        end
    end
  end
end
