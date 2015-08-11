
#------ ROOT  -------

get '/' do
  if logged_in?
    erb :dashboard
  else
    @signup_errors = session[:signup_errors]
    @login_errors = session[:login_errors]
    erb :splash, layout: false
  end
end

#------ DASHBOARD ----

  # get '/dashboard' do
  #   if request.xhr?
  #     erb :dashboard, layout: false
  #   else
  #     redirect '/'
  #   end
  # end

#------ LOGIN --------

post '/login' do
  login

  redirect '/'
end

#------ LOGOUT -------

get '/logout' do
  logout

  redirect '/'
end


