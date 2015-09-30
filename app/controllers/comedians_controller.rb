class ComediansController < ApplicationController
  before_action :set_comedian, only: [:show, :edit, :update, :destroy]

  # GET /comedians
  # GET /comedians.json
  def index
    @comedians = Comedian.all
    @comedians_user = User.comedian
    @posts = Post.all
  end

  # GET /comedians/1
  # GET /comedians/1.json
  def show
      @votes = Vote.all
      @vote = Vote.new
      @events = Event.all
      @event = Event.new
      if current_user
        @follows = current_user.follows
        @follow = current_user.follows.find_by(comedian_id:@comedian.id)
      end
      @followNew = Follow.new
      @cities = City.all
      @city = City.new
  end

  # GET /comedians/new
  def new
    @comedian = User.new
  end

  # GET /comedians/1/edit
  def edit
    @comedian_back = Comedian.find_by(id:current_user.id)
  end

  # POST /comedians
  # POST /comedians.json
  def create
    @comedian = User.new(comedian_params)
    respond_to do |format|
      if @comedian.save
        format.html { redirect_to @comedian, notice: 'Comedian was successfully created.' }
        format.json { render :show, status: :created, location: @comedian }
      else
        format.html { render :new }
        format.json { render json: @comedian.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /comedians/1
  # PATCH/PUT /comedians/1.json
  def update
    respond_to do |format|
      if @comedian.update(user_params)
        format.html { redirect_to @comedian, notice: 'Comedian was successfully updated.' }
        format.json { render :show, status: :ok, location: @comedian }
      else
        format.html { render :edit }
        format.json { render json: @comedian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comedians/1
  # DELETE /comedians/1.json
  def destroy
    @comedian.destroy
    respond_to do |format|
      format.html { redirect_to comedians_url, notice: 'Comedian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    def set_comedian
      if User.exists?(params[:id])
        @comedian = User.find(params[:id])
      else
        redirect_to comedians_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comedian_params
      params.require(:user).permit(:podcast_title, :podcast, :image, :username, :email, :password, :location, :photo, :bio, :twitter, :facebook, :instagram, :youtube)
    end
end
