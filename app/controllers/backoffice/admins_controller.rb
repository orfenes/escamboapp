class Backoffice::AdminsController < BackofficeController

  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    @admin = policy_scope(Admin)
  end


  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Administrador #{@admin.email} cadastrado com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "Dados #{@admin.email} atualizado com sucesso"
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    admin_email  = @admin.email
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Dados #{admin_email} deletado com sucesso"
    else
      render :index
    end
  end


  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    password = params[:admin][:password]
    password_confirmation = params[:admin][:password_confirmation]

    if password.blank? && password_confirmation.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

    params.require(:admin).permit(policy(@admin).permitted_attributes)
  end


end
