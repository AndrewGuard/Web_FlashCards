#--------login---------#

get '/login' do
  erb :login
end

post '/authuser' do
  if current_user
    redirect to '/' 
  else
    @user = User.find_by_user_name(params[:user_name])

    if @user.authenticate(params[:password])
      session[:id] = @user.id
      erb :index
    else
      erb :login
    end
  end
end

get '/logout' do
  session.clear
  redirect to ('/')
end



post '/createuser' do
  new_user = User.create(params[:post])
  session[:id] = new_user.id
  erb :index
end
