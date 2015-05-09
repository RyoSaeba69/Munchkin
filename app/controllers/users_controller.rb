class UsersController < ApplicationController
  before_action :authenticate_user!

  before_filter :find_user, :only => [:destroy, :enabled, :disabled]
  # authorize_resource

  def index

    if params[:search].present?
      @search = params[:search].strip
      @users = User.search(@search)
    else
      @users = User.all.order("created_at DESC")
    end

    if params[:approved].present?
      @users = @users.not_approved
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def enabled
    @user.update_columns(activated_at: Time.current)
    flash[:success] = 'L\'utilisateur a été activé avec succès'
    redirect_to users_url
  end

  def disabled
    flash[:success] = 'L\'utilisateur a été désactivé avec succès' if @user.update_attribute(:approved, false)
    redirect_to users_url
  end


  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def find_user
    @user = User.find(params[:id])
  end
end
