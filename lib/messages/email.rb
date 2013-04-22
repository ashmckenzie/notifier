module Notifier
  module Messages

    class Email

      attr_reader :from, :to, :subject, :body

      def initialize from, to, subject, body
        @from = from
        @to = to
        @subject = subject
        @body = body
      end

      def notify!
        Notifier::Jobs::Email.perform_async(self)
      end
    end
  end
end

# Notifier::Messages::Email.new('ash@greenworm.com.au', 'ash@greenworm.com.au', 'The subject', 'The body').notify!
