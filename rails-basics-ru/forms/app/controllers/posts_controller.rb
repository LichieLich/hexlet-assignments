# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'Post has been created'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Something went wrong'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post has been edited'
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Something went wrong'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = 'Post has been deleted'
      redirect_to posts_path
    else
      flash[:failure] = 'Something went wrong'
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :summary, :body, :published)
  end
end
