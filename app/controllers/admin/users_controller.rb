module Admin
  class UsersController < BaseController
    before_action :require_super_admin
    before_action :set_user, only: [ :edit, :update ]

    def index
      @users = User.order(created_at: :desc)
    end

    def add_moderator
      email = params[:email].to_s.strip
      user = User.find_by(email: email)

      if user.nil?
        redirect_to admin_users_path, alert: t("admin.user_not_found")
        return
      end

      user.update!(role: "moderator")
      redirect_to admin_users_path, notice: t("admin.moderator_added")
    end

    def edit
      load_role_options
    end

    def update
      if demoting_self_as_super_admin?
        load_role_options
        flash.now[:alert] = t("admin.cannot_demote_self", default: "Не можна понизити власну роль головного адміністратора")
        render :edit, status: :unprocessable_entity
        return
      end

      if @user.update(user_params)
        redirect_to admin_users_path, notice: t("admin.role_updated")
      else
        load_role_options
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def require_super_admin
      return if user_signed_in? && current_user.super_admin?

      redirect_to admin_root_path, alert: t("admin.access_denied")
    end

    def set_user
      @user = User.find(params[:id])
    end

    def load_role_options
      @role_options = if @user == current_user && @user.super_admin?
        [ [ "super_admin", t("admin.super_admin") ] ]
      else
        User::ROLES.map { |r| [ r, t("admin.#{r}") ] }
      end
    end

    def demoting_self_as_super_admin?
      @user == current_user &&
        @user.super_admin? &&
        user_params[:role] != "super_admin"
    end

    def user_params
      params.require(:user).permit(:role)
    end
  end
end
