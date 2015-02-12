class GenereateUrlsController < ApplicationController
  before_action :set_genereate_url, only: [:show, :edit, :update, :destroy]

  # GET /genereate_urls
  # GET /genereate_urls.json
  def index
    @genereate_urls = GenereateUrl.all
  end

  def genereate_short_url
      url = params[:url_name] 
        new_url = Shortener::ShortenedUrl.generate(url)
        @converted_url = new_url.unique_key
        respond_to do |format|
          format.json { render json: new_url.to_json }
        end

      # respond_to do |format|
      #   redirect_to genereate_urls_path
      #   format.js
      # end 
   
  end

  # GET /genereate_urls/1
  # GET /genereate_urls/1.json
  def show
  end

  # GET /genereate_urls/new
  def new
    @genereate_url = GenereateUrl.new
  end

  # GET /genereate_urls/1/edit
  def edit
  end

  # POST /genereate_urls
  # POST /genereate_urls.json
  def create
    @genereate_url = GenereateUrl.new(genereate_url_params)

    respond_to do |format|
      if @genereate_url.save
        format.html { redirect_to @genereate_url, notice: 'Genereate url was successfully created.' }
        format.json { render :show, status: :created, location: @genereate_url }
      else
        format.html { render :new }
        format.json { render json: @genereate_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genereate_urls/1
  # PATCH/PUT /genereate_urls/1.json
  def update
    respond_to do |format|
      if @genereate_url.update(genereate_url_params)
        format.html { redirect_to @genereate_url, notice: 'Genereate url was successfully updated.' }
        format.json { render :show, status: :ok, location: @genereate_url }
      else
        format.html { render :edit }
        format.json { render json: @genereate_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genereate_urls/1
  # DELETE /genereate_urls/1.json
  def destroy
    @genereate_url.destroy
    respond_to do |format|
      format.html { redirect_to genereate_urls_url, notice: 'Genereate url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genereate_url
      @genereate_url = GenereateUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def genereate_url_params
      params.require(:genereate_url).permit(:url_name)
    end
end
