class DepartmentsController < ApplicationController
    def departments_cities
        render json: Department.find(params[:department_id]).cities
    end
end
