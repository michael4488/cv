class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "Your user has been created successfuly!"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def destroy
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = "Your changes has been saved successfuly!"
      redirect_to @user
    else 
      render 'edit'
    end
  end
end
