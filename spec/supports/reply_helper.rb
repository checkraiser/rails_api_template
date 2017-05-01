module ReplyHelper
  def create_reply_params_for(user, ticket)
    create_params_with content: random_reply_content, user: user, ticket: ticket
  end
end
