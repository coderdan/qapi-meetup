module Qapi::Meetup
  class GroupQuery < Qapi::Query
    def all
      response = @connection.get("/2/groups", member_id: 'self')
      JSON(response.body)['results'].map do |result|
        Group.new(@connection, result)
      end
    end
  end
end
