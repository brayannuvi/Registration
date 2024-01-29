class CountriesController < ApplicationController
    def country_departments
        render json: Country.find(params[:country_id]).departments
    end
end
