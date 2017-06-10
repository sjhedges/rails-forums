class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comment_path
  end

  private

  def set_doctor
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:author, :text)

  end
end
