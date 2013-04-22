require 'mail'

module Notifier
  module Jobs

    class Email
      include Sidekiq::Worker

      def perform attributes
        msg = Hashie::Mash.new(attributes)

        Mail.deliver do
           from     msg.from
           to       msg.to
           subject  msg.subject
           body     msg.body
        end
      end
    end
  end
end
