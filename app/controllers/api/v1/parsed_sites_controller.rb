module Api::V1
  class ParsedSitesController < ApiController
    before_action :set_parsed_site, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    # GET /parsed_sites
    # GET /parsed_sites.json
    def index
      @parsed_sites = ParsedSite.all

      render json: @parsed_sites
    end

    # GET /parsed_sites/1
    # GET /parsed_sites/1.json
    def show
      render json: @parsed_site
    end

    # POST /parsed_sites
    # POST /parsed_sites.json
    def create
      @parsed_site = ParsedSite.new(parsed_site_params)

      if @parsed_site.save
        render json: @parsed_site, status: :created, location: @parsed_site
      else
        render json: @parsed_site.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /parsed_sites/1
    # PATCH/PUT /parsed_sites/1.json
    def update
      @parsed_site = ParsedSite.find(params[:id])

      if @parsed_site.update(parsed_site_params)
        head :no_content
      else
        render json: @parsed_site.errors, status: :unprocessable_entity
      end
    end

    # DELETE /parsed_sites/1
    # DELETE /parsed_sites/1.json
    def destroy
      @parsed_site.destroy

      head :no_content
    end

    private

      def set_parsed_site
        @parsed_site = ParsedSite.find(params[:id])
      end

      def parsed_site_params
        params.require(:parsed_site).permit(:url, :name)
      end
  end
end
