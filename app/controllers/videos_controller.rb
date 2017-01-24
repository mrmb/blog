class VideosController < ApplicationController
    def new 
        @video = Video.new
    end 
    
    def create 
        #render plain: params[:video].inspect
        @video = Video.new(video_params)
        if @video.save
            flash[:notice] = "Video was sucessfully created"
            redirect_to video_path(@video)
        else 
            render 'new'
        end 
    end
    
    def show 
        @video = Video.find(params[:id])
    end
    
    private 
      def video_params
          params.require(:video).permit(:title, :description)
      end
end