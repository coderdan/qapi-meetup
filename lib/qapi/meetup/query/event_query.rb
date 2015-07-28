
module Qapi::Meetup
  class EventQuery < Qapi::Query

    def all(group_id, options = {})
      response = @connection.get("/2/events", { group_id: group_id }.merge(check_options(options)))
      JSON(response.body)['results'].map do |result|
        Event.new(@connection, result)
      end
    end

    private
      def check_options(options)
        options.tap do |opts|
          if opts.has_key?(:time)
            time = opts[:time]
            opts[:time] = [(time.begin.to_i * 1000), (time.end.to_i * 1000)].join(',')
          end
        end
      end
  end
end
