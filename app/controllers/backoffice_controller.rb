class BackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout 'backoffice'

  # curremt_user to Pundit
  def pundit_user
    current_admin
  end

end