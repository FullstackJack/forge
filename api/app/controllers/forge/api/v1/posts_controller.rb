module Forge
  module Api
    module V1
      class PostsController < Forge::Api::BaseController

        def index
          @posts = Post.all
					authorize @posts
					render json: @posts
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
					authorize post
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
