class VideosController < ApplicationController
    before_action :set_video , only: [:edit,:update,:show,:destroy]
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
        @video = set_video
    end
    
    def edit 
        @video = set_video
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
    
    def destroy
      @video = set_video
      @video.destroy
      redirect_to videos_path
    end 
    private 
      def set_video 
          @video = Video.find(params[:id])
      end 
      def video_params
          params.require(:video).permit(:title, :description)
      end
end