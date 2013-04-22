module Notifier
  module Messages

    class Pushover

      attr_reader :title, :message, :user_key, :api_key

      def initialize title, message, user_key, api_key
        @title = title
        @message = message
        @user_key = user_key
        @api_key = api_key
      end

      def notify!
        Notifier::Jobs::Pushover.perform_async(self)
      end
    end
  end
end

# Notifier::Messages::Pushover.new('test', 'test', 'TPyY39ZfN5P9tvrQRmLyC3aXG8n8yV', 'BEp5LufnBUEBrNlt086TgHKnAjuFUk').notify!
