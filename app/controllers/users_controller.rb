class UsersController < ApplicationController

def index
    @users = User.joins(city: {department: :country}).select('users.*, cities.name as city_name, departments.name as department_name, countries.name as country_name').order(city_id: :asc)
end

def new
    @user = User.new
    @token = form_authenticity_token
end

def create
    @user = User.create(user_params)
    
    if @user.save
        flash[:notice] = 'Usuario creado exitosamente.'
        redirect_to @user
    else
        @token = form_authenticity_token
        render :new, status: :unprocessable_entity
    end
end

def edit
    @user = User.joins(city: {department: :country}).select('users.*, cities.id as city_id, departments.id as department_id, countries.id as country_id').where(id: params[:id]).last
    @token = form_authenticity_token
end

def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
end

def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
end

def get_all_users
    render json: User.all
end

def generate_pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'filename'
      end
    end
  end
private

def user_params
    params.require(:user).permit(:name, :last_name, :birthdate, :gender, :email, :address, :type_of_housing, :city_id, :extra_information)
end

end
