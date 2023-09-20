# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    #byebug
    auth = request.env['omniauth.auth']

    @identity = Identity.find_or_create_with_omniauth(auth)
    
    if user_signed_in?
      if @identity.user == current_user
        redirect_to root_url, notice: "Already linked that account!"
      elsif @identity.user.present?
        raise "error: identity is already used by another user"
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      user = User.create_with_omniauth(auth)
      if user.persisted?
        unless @identity.user.present?
          @identity.user = user
          @identity.save
        end
        sign_in_and_redirect @identity.user, event: :authentication
        if is_navigational_format?
          set_flash_message(:notice, :success, kind: auth['provider'].capitalize)
        end
      else
        session['devise.user_attributes'] = user.attributes
        session['devise.identity_attributes'] = auth.slice('provider', 'uid')
        redirect_to new_user_registration_url, notice: "Please finish registering"
      end
    end
  end

  Devise.omniauth_providers.each do |provider|
    alias_method provider, :all
  end

  def failure
    redirect_to root_url
  end
end
