
module Qapi::Meetup
  class Group < Qapi::Model
    attribute :id
    attribute :name
    attribute :group_photo

    def events(options = {})
      EventQuery.new(@connection).all(id, options)
    end
  end
end
