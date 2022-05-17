class TopController < ApplicationController
  
  def index
    @lists = List.where(user: current_user).order("created_at ASC")
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.valid?
      @user.update(update_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
    def update_params
      params.require(:user).permit(:image, :name, :email, :password, :text)
    end
end
