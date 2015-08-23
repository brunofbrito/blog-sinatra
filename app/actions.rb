class Post
  def timestamp
    created_at.strftime("%l:%M%P (%d/%m/%Y)")
  end
end

get "/" do
  @posts = Post.all.reverse
  @comments = Comment.all
  erb :index
end

get "/new/" do
  erb :addnew
end

post "/new/" do
  post = Post.new({
      title: params[:title],
      content: params[:content]
    })
  post.save
  redirect "/"
end

get "/show/:id" do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :show
end

get "/comment/new" do
  erb :show
end

post "/comment/new/:id" do
  comment = Comment.new({
      post_id: params[:id],
      title: params[:title],
      content: params[:content]
    })
  comment.save
  redirect "/"
end