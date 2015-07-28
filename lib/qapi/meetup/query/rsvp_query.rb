
module Qapi::Meetup
  class RsvpQuery < Qapi::Query
    def all(event_id, options = {})
      response = @connection.get("/2/rsvps", { event_id: event_id })
      JSON(response.body)['results'].map do |result|
        Rsvp.new(@connection, result)
      end
    end
  end
end
