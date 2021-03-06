class UsersController < ApplicationController
  before_action :logged_in?, only: [:show, :edit, :update]  
  before_action :logged_out?, only: [:new, :create]
  
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created user"
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      redirect_to new_user_path
     end
   end

  def show
    @user = User.find_by_id(params[:id])
    # events user is hosting
    # user >> reservations  >> events
    # user.events events where user.id is host_id
    @hosted_events = @user.events
    # events user is attending
    @attending_events = @user.reservations.map { |r|  Event.find(r.event_id) }.uniq
  end 

  def edit
    if current_user == set_user
      render :edit
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "Successfully Updated Profile"
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      flash[:notice] = "Successfully deleted user #{@user.last_name}"
      redirect_to root_path
    else
      flash[:notice] = "You can't delete that user."
      redirect_to user_path(@user)
    end
  end  

  def events_index
    @user = User.find(params[:id])
    @events = @user.events_indexs
  end  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_user
    user_id = params[:id] || current_user.id
    @user = User.find(user_id)
  end           
end