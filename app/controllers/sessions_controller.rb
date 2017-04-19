class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to '/login'
  end

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]

    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = root_path
      @notice = "You're signed in again with fb"
      session[:user_id] = user.id
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @next = root_path
      @notice = "Signed in first time with facebook"
      session[:user_id] = user.id
    end
    redirect_to @next, :notice => @notice
  end

end
