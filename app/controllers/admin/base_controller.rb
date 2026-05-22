module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    private

    def require_admin
      return if user_signed_in? && current_user.admin_access?

      redirect_to root_path(locale: I18n.locale), alert: t("admin.access_denied")
    end
  end
end
