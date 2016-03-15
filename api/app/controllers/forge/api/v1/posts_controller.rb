module Forge
  module Api
    module V1
      class PostsController < Forge::Api::BaseController

        def index
          page = params.fetch(:page, 1)
          count = params.fetch(:count, 10)
          if current_forge_user.present?
            posts = policy_scope(Post)
            authorize posts
          else
            posts = Post.where("publish_date < ?", Time.now)
            skip_authorization
          end
          render json: posts.page(page).per(count)
        end

        def create
          @post = current_forge_user.posts.build(post_params)
          authorize @post
          if @post.save
            render json: @post, status: :created
          else
            render json: {
              errors: [
                {
                  status: 400,
                  title: "Not Saved",
                  detail: "The post was not saved."
                }
              ]
            }, status: :bad_request
          end
        end

        def update
          post = Post.find(params[:id])
          authorize post
          if post.update(post_params)
           render json: post
          end
        end

        def show
          post = Post.find(params[:id])
          if current_forge_user.present?
            authorize post
          else
            if post.publish_date.nil?
              raise ActiveRecord::RecordNotFound
            end
          end
          render json: post
        end

        def destroy
          post = Post.find(params[:id])
          authorize post
          if post.destroy
            head :no_content
          end
        end

        private

        def post_params
          params.require(:post).permit(:title, :body, :published_at, :slug)
        end
      end
    end
  end
end
