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
    
    def edit 
        @video = Video.find(params[:id])
    end
    
    def update 
        @video = Video.new(video_params)
        if @video.update(video_params)
            flash[:notice] = "Video was sucessfully updated"
            redirect_to video_path(@video)
        else 
            render 'edit'
        end 
    end 
    
    def index 
        @videos = Video.all
    end
    
    private 
      def video_params
          params.require(:video).permit(:title, :description)
      end
end