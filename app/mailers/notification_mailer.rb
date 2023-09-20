class NotificationMailer < ApplicationMailer
  def notification_email(voter, votation)
    @voter = voter
    @votation = votation
    mail(to: @voter.email, subject: "Notificacion de resultados de Votacion #{votation.name}")
  end
end
