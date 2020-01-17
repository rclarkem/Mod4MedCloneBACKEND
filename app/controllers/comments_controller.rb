class CommentsController < ApplicationController
before_action :find_comment, only: [:show, :edit, :update, :destroy]

    def index
        @comments = Comment.all
        render json: @comments
    end

    def show
        render json: @comment
    end

    def create
        @comment = Comment.create(comment_params)
        if @comment.valid?
            render json: @comment, status: :created
        else
            render json: {errors: @comment.errors.full_messages}, status: 400
        end
    end

    def destroy
        @comment.destroy
        render json: @comment
    end

    private
    def find_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body, :author_id, :story_id)
    end
end
