class CommentsController < ApplicationController
    before_action :set_post
    before_action :authenticate_user!, except: [:show, :index]

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.name = current_user.username
        # @comment = @post.comments.create(comment_params)
        @comment.save 
        redirect_to @post
    end

    def edit
        
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to @post
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @post
    end

    private
    def comment_params
        params.require(:comment).permit( :content)
    end

    def set_post
        @post = Post.find(params[:post_id])
    end
end
