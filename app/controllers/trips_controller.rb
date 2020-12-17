class TripsController < ApplicationController
  def create
    asset = Asset.create!(create_params)
    render json: asset, root: 'trip'
  end

  def index
    render json: Asset.where(project: { id: 155 }).all, root: 'trips'
  end

  def destroy
    Asset.delete(params[:id])
    head :ok
  end

  def update
    asset = Asset.find(params[:id])
    asset.update!(update_params)
    render json: asset, root: 'trip'
  end

  def show
    asset = Asset.find(params[:id])
    render json: asset, root: 'trip'
  end

  private

  def create_params
    @create_params ||=
      params.require(:trip).permit(:description, :title).merge(project_id: 155)
  end

  def update_params
    @update_params ||=
      params.require(:trip).permit(:description, :title)
  end
end
