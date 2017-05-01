require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:user)           { create_user }
  let(:new_title)      { random_ticket_title }
  let(:new_body)       { random_ticket_body }
  
  context 'creates ticket' do
    let(:create_entity)  { Entity::Create }
    let(:create_params) do
      HashBuilder.build title: new_title, body: new_body, user: user
    end
    let(:create_command) { create_entity.use_repo(described_class).use_params(create_params) }
    let(:created_ticket) { user.tickets.first }

    it 'successfully creates ticket' do
      expect(create_command.call).to be_success
      expect(user.tickets.count).to eql(1)
      expect(created_ticket.title).to eql(new_title)
      expect(created_ticket.body).to eql(new_body)
      expect(created_ticket.status).to eql('open')
    end

    context 'fails creating ticket' do
      let(:create_params) do
        HashBuilder.build title: new_title, body: new_body, user: nil
      end

      it 'when user is nil' do
        expect(create_command.call).to be_failure
      end
    end
  end

  context 'updates ticket' do
    let(:update_entity)  { Entity::Update }
    let(:ticket)         { create_ticket(user) }
    let(:update_params) do
      HashBuilder.build title: new_title, body: new_body, status: 'closed'
    end
    let(:update_command) { update_entity.use_model(ticket).use_params(update_params) }

    it 'successfully updates ticket' do 
      expect(update_command.call).to be_success
      expect(ticket.title).to eql(new_title)
      expect(ticket.body).to eql(new_body)
      expect(ticket.status).to eql('closed')
    end

    context 'fails updating ticket' do
      context 'when status is invalid' do
        let(:update_params) { { status: 'unavailable' } }

        it { expect(update_command.call).to be_failure }        
      end

      context 'when title is empty' do
        let(:update_params) { { title: '' } }

        it { expect(update_command.call).to be_failure }        
      end

      context 'when body is empty' do
        let(:update_params) { { body: '' } }

        it { expect(update_command.call).to be_failure }        
      end
    end
  end
end
