class VarietiesController < ApplicationController
    def index
      @varieties = Variety.all
    end

    def show
      @variety = Variety.find(params[:id])
    end

    def new
      @variety = Variety.new
    end

    def create
      @variety = Variety.new(variety_params)

      if @variety.save
        redirect_to @variety
      else
        render :new
      end
    end

    def edit
      @variety = Variety.find(params[:id])
    end

    def update
      @variety = Variety.find(params[:id])

      if @variety.update(variety_params)
        redirect_to @variety
      else
        render :edit
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to root_path
    end

    private
      def variety_params
        params.require(:variety).permit(:name)
      end
end
