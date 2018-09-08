class SessionsController < ApplicationController

  def new
    #log in

  end

  def create
    #try to log in
    @form_data = params.require(:session)

    #pull username & password from form form_data
    @username = @form_data[:username]
    @password = @form_data[:password]

    #authenticate user
    @user = User.find_by(username: @username).try(:authenticate, @password)

    #if there is a user present
    if @user
      redirect_to root_path

      #save this use to that user's session
      session[:user_id] = @user.id







    else
      render "new"

    end



  end

  def destroy
    #log out
    #remove session completely
    reset_session


    #redirect to login page
    redirect_to new_session_path
  end





end
