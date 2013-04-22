require 'pushover'

module Notifier
  module Jobs

    class Pushover
      include Sidekiq::Worker

      def perform attributes
        msg = Hashie::Mash.new(attributes)

        ::Pushover.notification(
          title: msg.title,
          message: msg.message,
          user: msg.user_key,
          token: msg.api_key
        )
      end
    end
  end
end


