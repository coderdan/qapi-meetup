module Qapi::Meetup
  class Photo < Struct.new(:photo_id, :photo_link, :thumb_link)
  end

  class Member < Qapi::Model
    attr_reader :id, :name, :thumbnail
    attribute :id
    attribute :name
    attribute :city
    attribute :bio
    attribute :photo

    def photo
      if @photo
        Photo.new(*@photo.values_at('photo_id', 'photo_link', 'thumb_link'))
      end
    end
  end
end
