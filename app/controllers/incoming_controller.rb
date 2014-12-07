class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]
  
  def my_library
    @user = User.find(params[:id])
    @my_bookmarks = @user.bookmarks
    authorize! :show, @user, message: "You need to be an account holder."
  end

  def favorites
    @user = User.find(params[:id])
    @favorited_bookmarks = Bookmark.favorited(current_user)
    authorize! :show, @user, message: "You need to be an account holder."
  end

  def show 
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    decoded_body = nil
    sender = params['sender']
    subject = params['subject']
    body_plain = params["body-plain"]
    @user = User.find_by_email(sender)

    user = User.where(email: params["sender"]).first
    if !user  
      head 200 && return
    end
    user.bookmarks.create(url: params["body-plain"])
    head 200
    url = /\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:<>"]\s]|\/)))/.match(decoded_body)
  end
end