get '/login' do
  @login = ''
  erb :'users/login'
end

post '/login' do
  @login = params[:login]
  user = User.find_by(:login => @login)

  if(user && user.password == params[:password])
    auth_login(user)
    redirect '/drafts/new'
  else 
    @form_error = 'Unable to log you in'  
    erb :'users/login'
  end
  
end

get '/register' do
  @user = User.new
  erb :'users/register'
end

post '/register' do
  @user = User.create
  @user.login = params[:login]
  @user.password = params[:password]
  confirm = params[:password_confirmation]
  if @user.password != confirm
    @form_error = 'Your passwords did not match ' 
    erb :'users/register'
  elsif User.where(login: @user.login).count != 0
    @form_error = 'This login is already taken '  
    erb :'users/register'
  elsif !@user.save
    @form_error = 'Unable to register you '  
    erb :'users/register'
  else
    auth_login(@user)
    redirect '/drafts/new'
  end
end


get '/logout' do
  auth_logout
  redirect '/'
end


