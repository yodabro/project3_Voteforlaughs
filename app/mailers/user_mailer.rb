class UserMailer < ApplicationMailer

  default from: 'VoteForLaughs@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://voteforlaughs.heroku.com'
    mail(to: @user.email, subject: 'Welcome to VoteForLaughs')
  end

  def notification_email(event)
    @event = event
    @url = @event.tickets_link
    @comedian = Comedian.find_by(id:@event.comedian_id)
    @follows = @comedian.follows.all
    @users = []
    @user
      @follows.each do |follow|
        if follow.torf == true
          @user = User.find_by(id:follow.user_id)
          @users.push(@user.email)
        end
      end
    mail(to: 'VoteForLaughs@gmail.com', bcc: @users, subject: 'A Comedian you follow has an upcoming show!')
  end
end
