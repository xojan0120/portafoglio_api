module Api
  module V1
    class SkillsController < ApplicationController
      def index
        skills = Skill.all.map {|skill| { value: skill.name, label: skill.name } }
        if skills.any?
          render status: 200, json: { message: 'success', skills: skills }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end
    end
  end
end
