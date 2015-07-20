get "/" do
  @posts = Post.all
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
  erb :show
end