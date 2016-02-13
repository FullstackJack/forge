require_dependency "forgecms/application_controller"

module Forgecms
  class PostsController < ApplicationController
    layout "forgecms/admin"
    def index
      @posts = Post.all
      authorize @posts
    end

    def new
      @post = Post.new
      authorize @post
    end

    def create
      @post = current_user.posts.build(post_params)
      authorize @post
      if @post.save
        redirect_to edit_post_path(@post)
      else
        flash[:alert] = 'Post not saved!'
        render 'forgecms/posts/new'
      end
    end

    def edit
      @post = Post.find(params[:id])
      authorize @post
    end

    def update
      post = Post.find(params[:id])
      authorize post
      if post.update(post_params)
       flash[:alert] = 'Update failed!'
      end
      redirect_to edit_post_path(post)
    end

    def show
      @post = Post.find(params[:id])
      authorize @post
      render json: @post
    end

    def delete
      post = Post.find(params[:id])
      authorize post
      post.destroy
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :published_at, :slug)
    end
  end
end
