class NotificationMailer < ActionMailer::Base
  default from: '"Atendimento Sirva.me" <fbazzarella@gmail.com>'

  def new_lead
    mail to: '"Atendimento Sirva.me" <fbazzarella@gmail.com>', subject: 'Novo Lead!'
  end

  def fix_phone(sugestion)
    @sugestion = sugestion
    
    mail to: '"Atendimento Sirva.me" <fbazzarella@gmail.com>', subject: 'Nova Sugestão de Correção!'
  end
end
