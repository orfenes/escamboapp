class Backoffice::SendMailController < ApplicationController

  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      AdminMailer.send_message(current_admin, params[:'recipient-text'], params[:'subject-tex'], params[:'message-tex']).deliver_now
      @notfiy_message = 'Email enviado com sucesso'
      @notfiy_flag = 'success'
    rescue
      @notfiy_message = 'Erro ao enviar email. Tent novamente'
      @notfiy_flag = 'error'
    end

    respond_to do |format|
      format.js
    end
  end
end
