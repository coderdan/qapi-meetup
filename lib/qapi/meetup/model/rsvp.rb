
module Qapi::Meetup
  class Rsvp < Qapi::Model
    attribute :member
    attribute :member_photo

    def member
      Member.new(@connection, @member).tap do |mem|
        mem.id = @member['member_id']
        mem.photo = @member_photo
      end
    end
  end
end
