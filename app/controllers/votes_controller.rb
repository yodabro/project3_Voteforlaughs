class VotesController < ApplicationController
	before_action :set_votes, only: [ :destroy]

	def index
		@votes = Vote.all
	end

 	def new
 		@vote = Vote.new
 	end

 	def create
 		@vote = Vote.new(vote_params)
 		if @vote.save
      @city = City.find_by(id: @vote.city_id)
      @city.save
      flash[:message] = "Vote tallied"
      redirect_to :back
 		else
      flash[:message] = "Error"
 		end
 	end

	def destroy
    @vote.destroy
  end

 	private

	def set_vote
    if Vote.exists?(params[:id])
      @vote= Vote.find(params[:id])
    else
      redirect_to events_path
    end
  end

 	def vote_params
 		params.require(:vote).permit(:city_id, :comedian_id, :user_id)
 	end
end
