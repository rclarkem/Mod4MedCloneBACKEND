class StoriesController < ApplicationController
    before_action :find_story, only: [:show, :edit, :update, :destroy]
    
    def index
        if valid_token
        @stories = Story.order(id: :asc)
        render json: @stories
        end
        
    end

    def create
        if valid_token
        @story = Story.create(story_params)
        if @story.valid?
            render json: @story, status: :created
        else
            render json: {errors: @story.errors.full_messages}, status: 400
        end
    end
    end

    def show
        
        render json: @story
    
    end

    def destroy
        if valid_token
        @story.destroy
        render json: @story
        end
    end

    private
    def find_story
        @story = Story.find(params[:id])
    end

    def story_params
        params.require(:story).permit(:title, :body, :author_id)
    end

end
