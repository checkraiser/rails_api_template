module TicketHelper
  def create_ticket_for(user)
    create_entity.use(repo: Ticket, params: create_ticket_params_for(user).to_h).run.result
  end

  def create_ticket_params_for(user)
    create_params_with title: random_ticket_title, 
                       body: random_ticket_body, 
                       user: user
  end
end
