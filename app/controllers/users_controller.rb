class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @votes = current_user.votes.all
    @events = Event.all
    @event = Event.new
    @follows = current_user.follows
    @follow = current_user.follows.find_by(torf: true)
    @cities = City.all
    @city = City.new
    @showcomedian
  end

  # GET /users/new
  def new
    @user = User.new
    @comedian = User.new
    offset = Comedian.count
    if offset > 2
      until offset < Comedian.count-2 do
        offset = rand(Comedian.count)
      end
      puts offset
    end
    @comedians = User.comedian.limit(3).offset(offset)
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @comedian = Comedian.new(user_params)

    respond_to do |format|
      if @user.save
        if @user.user?
          UserMailer.welcome_email(@user).deliver_now
          format.html { redirect_to @user, notice: 'Welcome! Thanks for creating an account!' }
          format.json { render :show, status: :created, location: @user }
          login!(@user)
        elsif @user.comedian?
          UserMailer.welcome_email(@user).deliver_now
          @comedian = Comedian.new(user_params)
          @comedian.id = @user.id
          @comedian.save
          format.html { redirect_to @comedian, notice: 'Welcome! Thanks for creating an account!' }
          format.json { render :show, status: :created, location: @comedian }
          login!(@user)
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        if @user.user?
          format.html { redirect_to @user, notice: 'Your account was successfulyl updated!' }
          format.json { render :show, status: :created, location: @user }
          login!(@user)
        elsif @user.comedian?
          @comedian = Comedian.find_by(id:current_user.id)
          @comedian.save
          format.html { redirect_to @comedian, notice: 'Your profile was successfully updated!' }
          format.json { render :show, status: :created, location: @comedian }
          login!(@user)
        end
      else
        format.html { redirect_to new_user_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if User.exists?(params[:id])
        @user = User.find(params[:id])
      else
        redirect_to new_user_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:podcast_title, :podcast, :bio, :twitter, :instagram, :facebook, :youtube, :role, :image, :username, :email, :password, :location, :phone_number, :notify_radius, :comedian_id, :city_id)
    end
end
