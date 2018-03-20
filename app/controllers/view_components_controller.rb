class ViewComponentsController < ApplicationController
  before_action :get_view_components

  def index
  end

  def show
    @view_component = params[:id]
  end

  private

  def get_view_components
    @view_components = Dir["app/views/application/*.html.*"]
    return [] if @view_components.empty?
    pattern = /app\/views\/application\/(.*)\.html\.*/
    @view_components.map! {|f| f.scan(pattern).last.last}
  end
end
