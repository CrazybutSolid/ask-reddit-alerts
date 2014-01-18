class UserMailer < ActionMailer::Base

  def notify_new_thread(alert,url,title)
    @user = alert.user
    @url  = url
    @title = title
    mail(to: @user.email, subject: "one of your keywords showed up on AskReddit")
  end

end
