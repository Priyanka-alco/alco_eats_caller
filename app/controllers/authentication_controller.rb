class AuthenticationController < ApplicationController
  # skip_before_action :authenticate_request
  # before_action :authenticate_user!
  def authenticate
    check_user = User.where("email='#{params['email']}'")
    @res = {}
    # debugger
    if check_user[0]
      if check_user[0].password_digest == params['password']
        @res['success'] = true
        @res['page'] =  '/product_selling?status=200'
        session[:current_user_id] = params['email']
        session[:admin] = true if  params['email'] == "admin@gmail.com"
        session[:email_id] = params['email']
        puts "**************session***#{session[:current_user_id]}"
        @res['message'] = "Loggedin Successfully"
      else
        @res['success'] = false
        @res['page'] = '/caller_login?status=400'
        @res['message'] = "Please enter correct password"
      end
      @res['status'] = 200
    else
      @res['success'] = false
      @res['page'] = '/caller_login?status=300'
      @res['message'] = "Please enter correct email id"
      @res['status'] = 400
    end
    redirect_to @res['page']
  end

  def logout

  end
end