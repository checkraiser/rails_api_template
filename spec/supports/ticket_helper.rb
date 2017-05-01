module TicketHelper
  def create_ticket(user)
    create_entity
      .use_repo(Ticket)
      .use_params(ticket_params(user))
      .call
      .result
  end

  def ticket_params(user)
    create_params_with title: 'Sample ticket', 
                       body: 'Sample body', 
                       user: user
  end
end
