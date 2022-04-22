module Discussions
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_discussion
    before_action :set_post, only: [:edit, :update, :destroy]

    def create
      @post = @discussion.posts.new(post_params)
      respond_to do |format|
        @post.discussion.post_count += 1
        if @post.save
          format.html { redirect_to discussion_path(@discussion), notice: "Post created" }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.turbo_stream
        end
      end
    end

    def edit
    end

    def update
      if @post.update(post_params)
        respond_to do |format|
          format.html { redirect_to discussion_path, notice: "post updated."}
          format.turbo_stream { flash.now[:notice] = "post created"}
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @post.destroy
        respond_to do |format|
          format.html { redirect_to discussion_path, notice: "post destroyed"}
          format.turbo_stream { flash.now[:notice] = "post destroyed."}
        end
      end
    end

    private

    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body)
    end
  end
end