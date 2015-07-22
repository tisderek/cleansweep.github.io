helpers do

  def signup
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
  @user = User.find_by(phone_number: params[:phone_number])
    
    if @user.password == params[:password]
      @user.generate_token
      session[:token] = @user.token
      redirect "/dashboard"
    else
      redirect "/wrongpassword"
    end

  end

  def current_user
      if session[:token] == nil
        nil
      else
        User.find(session[:token])
      end
  end

  def logout
    session[:token] = nil
    redirect "/"
  end

  def current_user
    User.find_by(token: session[:token])
  end

  def username
    current_user.username
  end

  def user_id
    current_user.id
  end

end