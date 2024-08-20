class UsersController < ApplicationController

def index
    @users = User.cities
end


def export_pdf
  @users = User.cities

  @context = 'pdf'
  
  respond_to do |format|
    format.html # Para la vista HTML normal
    format.pdf do
      # Generar el PDF con WickedPDF
      pdf = WickedPdf.new.pdf_from_string(
        render_to_string(
          template: 'users/pdf',
              users: 'export_pdf',
              formats: [:html]
        ),
        orientation: 'Portrait'
      )

      # Enviar el archivo PDF para descarga
      send_data pdf,
                filename: "cities_report_#{DateTime.now}.pdf",
                type: 'application/pdf',
                disposition: 'attachment'
    end
  end

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
    @user = User.specific_city(params[:id])
    @token = form_authenticity_token
end

def update
    @user = User.specific_city(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'Usuario actualizado exitosamente.'
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
end

def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, status: :see_other
end

def get_all_users
    render json: User.cities
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
