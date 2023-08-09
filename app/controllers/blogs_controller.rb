class BlogsController < ApplicationController

  def index
    @blogs = Blog.all.order(id: :desc)
  end

  def new
    @blog = Blog.new
  end


  def create
    @blog = Blog.new(blog_params)
    if  @blog.save
        redirect_to blogs_path, notice: '新增文章成功'  
    else
        render :new
    end
  end


  def show
    @blog = Blog.find(params[:id])
  end


  def edit
    @blog = Blog.find(params[:id])
  end


  def update
    @blog = Blog.find(params[:id])
    if @article.update(blog_params)
        redirct_to blogs_path, notice: '更新文章成功'
    else
        render :edit
    end    
  end



  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: '文章刪除成功'
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end


end
