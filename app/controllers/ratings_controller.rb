class RatingsController < ApplicationController
  wrap_parameters format: :json
  respond_to :json, :html
  before_filter :set_movie

  def upindex
    @upratings = Uprating.all
    respond_with @upratings
  end

  def downindex
    @downratings = Downrating.all
    respond_with @downratings
  end

  def saveindex
    @saveratings = Saverating.all
    respond_with @saveratings
  end

  def new
  end

  def create

    @uprate = Uprating.create(
      user_id: current_user,
      movie_id: @movie.id,
      )

    @downrate - Downrating.create(
      user_id: current_user,
      movie_id: @movie.id,
      )

    @saverate - Saverating.create(
      user_id: current_user,
      movie_id: @movie.id,
      )

    if @uprate.save
      respond_to do |format|
          format.html
          format.json { render json: @uprate, status: :created }
        end
      else
        respond_to do |format|
          format.html
          format.json { render json: @uprate.errors, status: :unprocessable_entity }
        end
      end

    if @downrate.save
      respond_to do |format|
          format.html
          format.json { render json: @downrate, status: :created }
        end
      else
        respond_to do |format|
          format.html
          format.json { render json: @downrate.errors, status: :unprocessable_entity }
        end
      end

    if @saverate.save
      respond_to do |format|
          format.html
          format.json { render json: @saverate, status: :created }
        end
      else
        respond_to do |format|
          format.html
          format.json { render json: @saverate.errors, status: :unprocessable_entity }
        end
      end
  end
  private
  def set_movie
    @movie = Movie.find(params[:id])
  end
end


