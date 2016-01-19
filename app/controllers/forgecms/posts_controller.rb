require_dependency "forgecms/application_controller"

module Forgecms
  class PostsController < ApplicationController
    layout "forgecms/admin"
    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to edit_post_path(@post)
      else
        flash[:alert] = 'Post not saved!'
        render 'forgecms/posts/new'
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      post = Post.find(params[:id])
      if post.update(post_params)
       flash[:alert] = 'Update failed!'
      end
      redirect_to edit_post_path(post)

    end

    def delete
      Post.delete(params[:id])
    end

    private

    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end
