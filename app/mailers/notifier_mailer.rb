class NotifierMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.new_lead.subject
  #
  default to: User.admins.map(&:email),
          from: 'notificattions@anelcanto.com'

  def new_lead
    @greeting = 'Hi'
    mail(
      subject: 'New lead',
      to: User.admins.first.email,
      track_opens: 'true',
      message_stream: 'outbound'
    )
  end
end
