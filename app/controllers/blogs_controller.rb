class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order(id: :desc)
  end

  def new
    @blog = Blog.new
  end 

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: '新增文章成功' 
    else
      render :new
    end
  end

  def show
    find_blog
  end

  def edit
    find_blog
  end

  def update
    find_blog
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: '更新文章成功'
    else
      render :edit
    end    
  end

  def destroy
    find_blog
    @blog.destroy
    redirect_to blogs_path, notice: '文章刪除成功'
  end
 
  private

  def find_blog
    @blog = Blog.find(params[:id])
  end 

  def blog_params
    params.require(:blog).permit(:title, :content)
  end 
end
