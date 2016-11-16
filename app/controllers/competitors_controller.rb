class CompetitorsController < ApplicationController
  def create
  	email = params[:competitor][:email]
  	email = params[:competitor][:score].to_i
  	competitor = Competitor.find_by_email(email)

  	if competitor && competitor.score < score
  		competitor.update(competitor_params) if competitor.score < score
  	else
  		Competitor.create(competitor_params)
  	end

  	redirect_to competitors_path
  end

  def index
  	@competitors = Competitor.all.order(score: :desc).limit(10)
  end

  private

  	def competitor_params
  		params.require(:competitor).permit(:email,:score)
  	end
end
