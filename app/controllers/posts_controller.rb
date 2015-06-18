class PostsController < ApplicationController

def new
  @post = Post.new
end

def create
  @post = Post.new(post_params)

  @post.save

  # ↓あとでやる
  redirect_to "/posts/#{@post.id}"

end

def show
  @post = Post.find(params[:id])
end

def index
  @posts = Post.all
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])

  @post.update_attributes(post_params)

  redirect_to "/posts/#{@post.id}"

end

def destroy
  @post = Post.find(params[:id])

  @post.destroy

  redirect_to "/"
end

private

def post_params
  params.require(:post).permit(
    :title,
    :body,
    :category
    )

end




end
