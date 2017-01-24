class VideosController < ApplicationController
    def new 
        @video = Video.new
    end 
    
    def create 
        #render plain: params[:video].inspect
        @video = Video.new(article_params)
        @video.save
        redirect_to_article_show(@article)
    end
    
    private 
      def article_params
          params.require(:video).permit(:title, :description)
      end
end