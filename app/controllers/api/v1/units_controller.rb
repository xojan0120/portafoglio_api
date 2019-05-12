module Api
  module V1
    class UnitsController < ApplicationController
      def index
        units = Unit.all.map {|unit| { value: unit.name, label: unit.name } }
        if units.any?
          render status: 200, json: { message: 'success', periodUnits: units }
        else
          render status: 404, json: { message: 'Not found' }
        end
      end
    end
  end
end
