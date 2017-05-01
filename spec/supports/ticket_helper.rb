module TicketHelper
  def create_ticket_for(user)
    create_entity
      .use_repo(Ticket)
      .use_params(
        create_ticket_params_for(user)
          .to_h
      ).call
      .result
  end

  def create_ticket_params_for(user)
    create_params_with title: random_ticket_title, 
                       body: random_ticket_body, 
                       user: user
  end
end
