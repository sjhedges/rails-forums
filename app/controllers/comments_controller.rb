class CommentsController < ApplicationController
  before_action :set_comment, except: [:index, :new, :create]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_comment_path(@post, @comment), notice: 'Post Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_comment_path(@post, @comment), notice: 'Comment Successfully Edited!'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    comment.destroy
    redirect_to post_comments_path, notice: 'Comment Successfully Deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author)
  end

  def set_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
  end
end
