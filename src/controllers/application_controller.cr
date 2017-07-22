class ApplicationController < Amber::Controller::Base
  LAYOUT = "application.slang"

  @_current_user : User | Nil

  def render_validation_errors(errors : Array(Amber::Validators::Error))
    {errors: errors.map { |e| {field: e.param, message: e.message} }}.to_json
  end

  def current_user
    return @_current_user if @_current_user
    return nil if session["user_id"].nil?

    @_current_user = User.find(session["user_id"])
  end

  def logged_in?
    !!session["user_id"]
  end
end
