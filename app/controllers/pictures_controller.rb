class PicturesController < ApplicationController
  skip_forgery_protection

  def create
    shot = Shot.create!(create_params)
    shot.assets << trip
    render json: shot, root: 'picture'
  end

  def index
    render json: trip.shots.all, root: 'pictures'
  end

  def destroy
    Shot.delete(params[:id])
    head :ok
  end

  private

  def create_params
    @create_params ||=
      begin
        params_for_create = params.require(:picture).permit(:title, :description, :url).merge(project_id: 155)
        params_for_create[:code] = params_for_create[:title]
        params_for_create.delete(:title)
        params_for_create[:sg_image_url] = params_for_create[:url]
        params_for_create.delete(:url)
        params_for_create
      end
  end

  def trip
    @trip ||= Asset.find(params[:trip_id].to_i)
  end
end
