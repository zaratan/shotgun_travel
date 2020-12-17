class TripsController < ApplicationController
  skip_forgery_protection

  def create
    asset = Asset.create!(create_params)
    render json: asset, root: 'trip'
  end

  def index
    render json: Asset.where(project: { id: 155 }).all, root: 'trips'
  end

  def destroy
    Asset.find(params[:id]).destroy
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
      begin
        params_for_create = params.require(:trip).permit(:description, :title).merge(project_id: 155)
        params_for_create[:code] = params_for_create[:title]
        params_for_create.delete(:title)
        params_for_create
      end
  end

  def update_params
    @update_params ||=
      begin
        params_for_update = params.require(:trip).permit(:description, :title)
        params_for_update[:code] = params_for_update[:title] if params_for_update[:title]
        params_for_update.delete(:title)
        params_for_update
      end
  end
end
