
module Qapi::Meetup
  class Connection < Qapi::Connection
    self.site = "https://api.meetup.com"
    self.token_url = "/oauth2/access"

    # Can do stuff like conn.groups.all
    def groups
      GroupQuery.new(self)
    end

    # conn.members.find(id)
    # conn.members.me
    def members
      MemberQuery.new(self)
    end
  end
end
