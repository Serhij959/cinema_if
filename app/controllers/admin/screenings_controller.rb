module Admin
  class ScreeningsController < BaseController
    before_action :set_screening, only: [ :edit, :update, :destroy ]

    def index
      @screenings = Screening
        .includes(:movie, :hall)
        .order(show_date: :desc, show_time: :asc)
    end

    def new
      @screening = Screening.new
      load_form_options
    end

    def create
      normalize_show_time_params

      unless valid_show_time_format?
        @screening = Screening.new(screening_params)
        load_form_options
        flash.now[:alert] = t("admin.invalid_time_format")
        render :new, status: :unprocessable_entity
        return
      end

      @screening = Screening.new(screening_params)

      if @screening.save
        redirect_to admin_screenings_path
      else
        load_form_options
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      load_form_options
    end

    def update
      normalize_show_time_params

      unless valid_show_time_format?
        load_form_options
        flash.now[:alert] = t("admin.invalid_time_format")
        render :edit, status: :unprocessable_entity
        return
      end

      if @screening.update(screening_params)
        redirect_to admin_screenings_path
      else
        load_form_options
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @screening.destroy
      redirect_to admin_screenings_path
    end

    private

    def set_screening
      @screening = Screening.find(params[:id])
    end

    def load_form_options
      @movies = Movie.order(:title)
      @halls = Hall.order(:name)
      @format_options = %w[2D 3D LUX IMAX]
    end

    def normalize_show_time_params
      return unless params[:screening] && params[:screening][:show_time]

      time = params[:screening][:show_time].to_s.strip.tr("/.", ":")
      time = time[0, 5] if time.match?(/\A\d{2}:\d{2}:\d{2}\z/)
      params[:screening][:show_time] = time
    end

    def valid_show_time_format?
      time = params.dig(:screening, :show_time).to_s.strip
      time.present? && time.match?(/\A\d{2}:\d{2}\z/)
    end

    def screening_params
      params.require(:screening).permit(
        :movie_id,
        :hall_id,
        :show_date,
        :show_time,
        :format,
        :price
      )
    end
  end
end
