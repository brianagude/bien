class UsersController < ApplicationController

  def index
    @users  = User.all
  end

  def show
    @user = User.find_by(username: params[:id])
  end

  def new
    #new user form
    @user = User.new
  end

  def create
    #take parameters from the form
    #create a new user

    @user = User.new(form_params)

    #if its valid and it saves, go to the list users page
    #if not, see the form with errors
    if @user.save
      redirect_to users_path
      #save the session with user
      session[:user_id] = @user.id
    else
      render "new"
    end

  end

  def form_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end





end
