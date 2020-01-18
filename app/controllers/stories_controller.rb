class StoriesController < ApplicationController
    before_action :find_story, only: [:show, :edit, :update, :destroy]
    
    def index
        # if valid_token
        @stories = Story.order(id: :asc)
        render json: @stories
        # else 
            # render json: {error: 'No access given'}
    
        
    end

    def create
        @story = Story.create(story_params)
        if @story.valid?
            render json: @story, status: :created
        else
            render json: {errors: @story.errors.full_messages}, status: 400
        end
    end

    def show
        if valid_token
        render json: @story
        else
             render json: {error: 'No access given'}
        end
    end

    def destroy
        if valid_token && logged_in_user_decoded == @story.author_id
        @story.destroy
            render json: {success: ['Your story deleted']}, status: 200
        else
            render json: {errors: {:story_author => "Story belongs to another user", :reason => "This is not your story"}}, status: 400
        end
    end

    private
    def find_story
        begin
            @story = Story.find(params[:id])
        rescue 
          render json: {errors: ['This does not exist']}, status: 404
        end
    end

    def story_params
        params.require(:story).permit(:title, :body, :author_id)
    end

end
