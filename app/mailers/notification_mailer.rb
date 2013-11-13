class NotificationMailer < ActionMailer::Base
  default from: '"Sirva.me Apps" <fale-com@sirva.me>'

  def new_lead
    mail to: '"Atendimento Sirva.me" <fale-com@sirva.me>', subject: 'Novo Lead!'
  end

  def fix_phone(sugestion)
    @sugestion = sugestion
    
    mail to: '"Atendimento Sirva.me" <fale-com@sirva.me>', subject: 'Nova Sugestão de Correção!'
  end
end
