class SaveController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    authenticate_user!
    @giphies = current_user.giphies
  end

  def create
    authenticate_user!
    @giphy = Giphy.new(params.permit(:image, :title, :created_at))
    @giphy.user_id = current_user.id

    respond_to do |format|
      if @giphy.save
        format.html { redirect_to @giphy, notice: "Giphy was successfully saved!" }
        format.json { render :show }
      else
        format.html { render :new }
        format.json { render json: @giphy.errors, status: :unprocessable_entity }
      end
    end
    # binding.pry
  end

end
