module Qapi::Meetup
  class UserQuery < Qapi::Query
    def find(id)
      response = @connection.get("/2/member/#{id}")
      # TODO: Check the response
      Member.new(@connection, JSON(response.body))
    end

    def me
      find('self')
    end
  end
end
