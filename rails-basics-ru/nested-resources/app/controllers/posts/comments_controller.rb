class Posts::CommentsController < Posts::ApplicationController
  before_action :resource_post, only: %i[ create new ]
  before_action :set_post_comment, only: %i[ edit update destroy ]

  def new
    @comment = @post.post_comments.build
  end

  def edit
  end

  def create
    @comment = @post.post_comments.build(post_comment_params)

    if @comment.save
      redirect_to post_path(@comment.post), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(post_comment_params)
      redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    
    redirect_to @comment.post, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_post_comment
    @comment = PostComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end
