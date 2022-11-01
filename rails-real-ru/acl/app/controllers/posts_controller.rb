# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    authorize Post
    @post = current_user.posts.build
  end

  def create
    authorize Post
    @post = current_user.posts.build(post_params)
    

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post

    if @post.destroy
      redirect_to posts_path
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
  # END
end
