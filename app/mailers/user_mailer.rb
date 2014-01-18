class UserMailer < ActionMailer::Base
	default :from => '"Ask Reddit Alerts" <anto@antomontani.com>'
  def notify_new_thread(alert,url,title)
    @user = alert.user
    @url  = url
    @title = title
    mail(to: @user.email, subject: "one of your keywords showed up on AskReddit")
  end

end
