class StoriesController < ApplicationController
    before_action :find_story, only: [:show, :edit, :update, :destroy]
    
    def index
        @stories = Story.all.order(created_at: :desc).first(6)
        render json: @stories
    end

    def create
        @story = Story.create(story_params)
        render json: @story
    end

    def show
        render json: @story
    end

    private
    def find_story
        @story = Story.find(params[:id])
    end

    def story_params
        params.require(:story).permit(:title, :body)
    end

end
