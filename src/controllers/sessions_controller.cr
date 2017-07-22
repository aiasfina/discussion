class SessionsController < ApplicationController 
  def create
    response.content_type = "application/json"

    user = User.login_from_user params["email"], params["password"]

    if user.is_a? User
      session["user_id"] = user.id.to_s
    else
      response.status_code = 401
    end

    ""
  end

  def destroy
    "destroy"
  end
end
