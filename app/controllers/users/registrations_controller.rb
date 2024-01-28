class Users::RegistrationsController < Devise::RegistrationsController
    def create
      super do |user|
        if user.persisted?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: new_user_session_path and return
        end
      end
    end
end
  