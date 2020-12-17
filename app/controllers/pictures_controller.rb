class PicturesController < ApplicationController
  def create
    shot = Shot.create!(create_params)
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
      params.require(:picture).permit(:title, :description, :url).merge(project_id: 155)
  end

  def trip
    @trip ||= Asset.find(params[:trip_id].to_i)
  end
end
