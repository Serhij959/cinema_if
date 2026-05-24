module Admin
  class UsersController < BaseController
    before_action :require_super_admin
    before_action :set_user, only: [ :remove_moderator ]

    def index
      @users = User.where(role: %w[moderator super_admin]).order(created_at: :desc)
    end

    def add_moderator
      email = params[:email].to_s.strip
      user = User.find_by(email: email)

      if user.nil?
        redirect_to admin_users_path, alert: t("admin.user_not_found")
        return
      end

      if user.super_admin?
        redirect_to admin_users_path, alert: t("admin.cannot_change_super_admin")
        return
      end

      if user.moderator?
        redirect_to admin_users_path, alert: t("admin.user_already_moderator")
        return
      end

      user.update!(role: "moderator")
      redirect_to admin_users_path, notice: t("admin.moderator_added")
    end

    def remove_moderator
      if @user.super_admin?
        redirect_to admin_users_path, alert: t("admin.cannot_change_super_admin")
        return
      end

      unless @user.moderator?
        redirect_to admin_users_path
        return
      end

      @user.update!(role: "user")
      redirect_to admin_users_path, notice: t("admin.moderator_removed")
    end

    private

    def require_super_admin
      return if user_signed_in? && current_user.super_admin?

      redirect_to admin_root_path, alert: t("admin.users_access_denied")
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
