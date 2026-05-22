module Admin
  class AnnouncementsController < BaseController
    before_action :set_announcement, only: [ :edit, :update, :destroy ]

    def index
      @announcements = Announcement.order(created_at: :desc)
    end

    def new
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.new(announcement_params)

      if @announcement.save
        redirect_to admin_announcements_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @announcement.update(announcement_params)
        redirect_to admin_announcements_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @announcement.destroy
      redirect_to admin_announcements_path
    end

    private

    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(
        :title,
        :title_en,
        :poster,
        :release_date,
        :description,
        :description_en
      )
    end
  end
end
