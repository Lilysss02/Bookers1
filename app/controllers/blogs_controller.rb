class BlogsController < ApplicationController
  def top
  end

  def index
  	# 記事を全件取得
  	@blogs = Blog.all
  	@blog = Blog.new
  end

  def create
  	# ストロングパラメーターを使用
  	blog = Blog.new(blog_params)
  	# DBへ保存する
  	if blog.save
  		flash[:create] = 'Book was successfully created.'
  		# 投稿詳細画面(show)へ移動"
  		redirect_to blog_path(blog.id)
  	else
  	end

  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def edit
  	@blog = Blog.find(params[:id])
  end

def update
	blog = Blog.find(params[:id])
	if blog.update(blog_params)
		flash[:update] = 'Book was successfully update.'
		redirect_to blog_path(blog.id)
	else
		render "index"
	end
end

def destroy
	blog = Blog.find(params[:id])
	# レコードをDBから削除
	if blog.destroy
		flash[:destroy] = 'Book was successfully destroyed.'
	  # 投稿一覧画面(index)へ移動
	  redirect_to blogs_path
	else
	end
end

  private

  def blog_params
  	params.require(:blog).permit(:title, :body)
  end
end
