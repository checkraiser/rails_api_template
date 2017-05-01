module ReplyHelper
  def create_reply_params_for(ticket, user)
    create_params_with content: random_reply_content, 
                       user: user, 
                       ticket: ticket
  end
end
