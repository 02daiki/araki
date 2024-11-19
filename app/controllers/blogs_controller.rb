class BlogsController < ApplicationController

  before_action :authenticate_user!

  def index
    @blogs = Blog.all
    @overlapping_blogs = overlapping_blogs(@blogs)
    @filtered_blogs = @blogs.select { |blog| blog.category == "task" || blog.deadline.present? }
    @upcoming_blogs = @filtered_blogs.select do |blog|
      (blog.start_time >= Date.today && blog.start_time <= 3.days.from_now) || 
      (blog.deadline.present? && blog.deadline >= Date.today && blog.deadline <= 3.days.from_now)
    end
    @next_week_blogs = @filtered_blogs.select do |blog|
      (blog.start_time >= Date.today && blog.start_time <= 1.week.from_now) || 
      (blog.deadline.present? && blog.deadline >= Date.today && blog.deadline <= 1.week.from_now)
    end

  end
  
  def overlapping_blogs(blogs)
    overlapping = []
  
    blogs.each do |blog1|
      next if blog1.start_time.nil? || blog1.finish_time.nil? # nilチェック
  
      blogs.each do |blog2|
        next if blog1 == blog2 # 同じブログを比較しない
        next if blog2.start_time.nil? || blog2.finish_time.nil? # nilチェック
  
        if blog1.start_time.to_date == blog2.start_time.to_date # 日付が同じ
          if (blog1.start_time < blog2.finish_time) && (blog2.start_time < blog1.finish_time) # 時間帯が重なる
            overlapping << blog1
            break # 重複が見つかったら次のブログへ
          end
        end
      end
    end
  
    overlapping
  end

  def new
    @blog = Blog.new
  end

  def show
    puts params.inspect
    @blog = Blog.find(params[:id])
  end

  def task
    puts params.inspect
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_parameter)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time, :category, :deadline, :finish_time, :color)
  end

  def blogs_params
    params.require(:register).permit(:tag_ids)
  end

end
