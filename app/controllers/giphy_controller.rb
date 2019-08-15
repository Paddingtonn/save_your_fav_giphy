class GiphyController < ApplicationController

  protect_from_forgery unless: -> { request.format.json? }

  BASE_URL = "http://api.giphy.com/v1/gifs/search"
  # SEARCHED_GIPH = "api_key=#{ENV['GIPHY_API_KEY']}"

  def response_from_giphy(input, number)
    request = HTTParty.get(BASE_URL, query: search_format(input, number)).to_json
    response_hash = JSON.parse(request)
    # p search_format.to_query
    # p response_hash
    response_hash["data"].map { |ele| ele }
  end

  def search_format(input, number)
    {
      q: input,
      api_key: ENV['GIPHY_API_KEY'],
      limit: number
    }
  end

  def create
    render json: response_from_giphy(params[:input], params[:number])
  end

  # def show
  #   @user_search_input = params[:q]
  #   @user_limit_input = params[:number]
  #   @response = response_from_giphy
  #   @gifs = @response
  #   # override defoult action which is looking for a view
  #   render json: { gifs: @gifs }
  # end

  def post_dada
    respond_to do |format|
      format.json { render json: query }
    end
  end


end
