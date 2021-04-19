class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update ]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
    @pictures = @user.pictures.order(created_at: :desc)
    favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc)
    #@favorites = Picture.find(favorite)
  end

  # GET /users/1/edit
  def edit
  end
  def update
  
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
  
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :show
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end   
    
    else
        redirect_to root_url
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
