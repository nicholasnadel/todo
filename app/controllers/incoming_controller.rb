class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
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
    url[0]
  end
end