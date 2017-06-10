class PostsController < ApplicationController
  #before_action :set_post, except: [:index, :new, :create]

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts

  end

  def show
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])

  end

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.new
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(post_params)
    if @post.save
      redirect_to category_post_path(@category, @post), notice: 'Post Created!'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to category_post_path(@category, @post), notice: 'Post Successfully Edited!'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    post = @category.posts.find(params[:id])
    post.destroy
    redirect_to category_posts_path, notice: 'Post Successfully Deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end

  def set_post
    @post = @category.posts(params[:id])
  end
end
