class AppsController < ApplicationController
    before_action :authenticate_user!
    def new
        @app = current_user.build_app
    end
    
    def create
        @app = current_user.build_app(app_params)
        if @app.save
          redirect_to root_path, notice: 'Application submitted successfully.'
        else
          render :new
        end
    end
    
    private
    
    def app_params
        params.require(:app).permit(:name, :address, :categories, :phone_number)
    end

end
