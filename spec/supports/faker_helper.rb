module FakerHelper
  def random_ticket_title
    Faker::Lorem.sentence
  end

  def random_ticket_body
    Faker::Lorem.paragraph
  end

  def random_email
    Faker::Internet.email
  end

  def random_first_name
    Faker::Name.first_name
  end

  def random_last_name
    Faker::Name.last_name
  end

  def random_reply_content
    Faker::Lorem.paragraph
  end  
end
