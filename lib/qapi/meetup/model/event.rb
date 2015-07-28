
module Qapi::Meetup
  class Event < Qapi::Model
    attribute :id
    attribute :time
    attribute :name

    def rsvps
      RsvpQuery.new(@connection).all(id)
    end

    def time
      Time.at(@time.to_i / 1000.0)
    end
  end
end
