# class GiphiesController < ApplicationController
#   before_action :set_giphy, only: [:show, :edit, :update, :destroy]

#   # GET /giphies
#   # GET /giphies.json
#   def index
#     @giphies = Giphy.all
#   end

#   # GET /giphies/1
#   # GET /giphies/1.json
#   def show
#   end

#   # GET /giphies/new
#   def new
#     @giphy = Giphy.new
#   end

#   # GET /giphies/1/edit
#   def edit
#   end

#   # POST /giphies
#   # POST /giphies.json
#   def create
#     @giphy = Giphy.new(giphy_params)

#     respond_to do |format|
#       if @giphy.save
#         format.html { redirect_to @giphy, notice: 'Giphy was successfully created.' }
#         format.json { render :show, status: :created, location: @giphy }
#       else
#         format.html { render :new }
#         format.json { render json: @giphy.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /giphies/1
#   # PATCH/PUT /giphies/1.json
#   def update
#     respond_to do |format|
#       if @giphy.update(giphy_params)
#         format.html { redirect_to @giphy, notice: 'Giphy was successfully updated.' }
#         format.json { render :show, status: :ok, location: @giphy }
#       else
#         format.html { render :edit }
#         format.json { render json: @giphy.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /giphies/1
#   # DELETE /giphies/1.json
#   def destroy
#     @giphy.destroy
#     respond_to do |format|
#       format.html { redirect_to giphies_url, notice: 'Giphy was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_giphy
#       @giphy = Giphy.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def giphy_params
#       params.require(:giphy).permit(:image, :title)
#     end
# end
