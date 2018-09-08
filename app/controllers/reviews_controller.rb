class ReviewsController < ApplicationController

#check if logged in
before_action :check_login, except: [:index, :show]

  def index
    # this is our list page for our reviews

    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    #start with all ReviewsController
    @reviews = Review.all

    #filtering by Price
    if @price.present?
      @reviews = @reviews.where(price: @price)
    end

    #filter by Cuisine
    if @cuisine.present?
      @reviews = @reviews.where(Cuisine: @cuisine)
    end

    #search near the location
    if @location.present?
      @reviews = @reviews.near(@location)
    end



  end


  def new
    # the form for adding a new review
    @review = Review.new
  end


  def create
    #take info from the form and add it to the model
    #the : is in front because they're called symbols => variables that stay the same
    @review = Review.new(form_params)

    #then associate it with a user
    @review.user = @current_user

    #check if the model can be saved
    #if yes, go to the home page
    #if no, show the new form
    if @review.save
      redirect_to root_path
    else
      #show the view for new.html.erb
      render "new"
    end



  end

  def show
    #individual review page
    @review = Review.find(params[:id])

  end

  def destroy
    #find the individual review
    @review = Review.find(params[:id])



    #if they are the user, they can destroy
    if @review.user == @current_user
      @review.destroy
    end

    #redirect to the home page
    redirect_to root_path
  end




  def edit
    #find the individual review to edit
    @review = Review.find(params[:id])




    # if thye're not the user, redirect to home page
    if @review.user != @current_user
      redirect_to root_path
    end
  end






  def update
    #find the individual #review
    @review = Review.find(params[:id])


    if @review.user !=@current_user
      redirect_to root_path
    else
      #update with the new info from the form
      if @review.update(form_params)

        #redirect somewhere new
        redirect_to review_path(@review)
      else
        render "edit"
      end
    end
    

  end

  def form_params
    params.require(:review).permit(:title, :body, :restaurant, :score, :ambiance, :price, :address)
  end







end
