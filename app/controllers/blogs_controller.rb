class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    blog =  Blog.new(blog_parameter)
    if blog.start_time = "nil"
      blog.start_time = Time.now
    end
    if blog.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end
  
  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time)
  end

end
