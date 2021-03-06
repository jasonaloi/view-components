class ViewComponentsController < ApplicationController
  before_action :get_view_components

  def index
  end

  def show
    @view_component = params[:id]
    @examples = get_examples(@view_component)
    @comment = get_comment(@view_component)
  end

  private

  def get_view_components
    @view_components = Dir["app/views/application/*.html.*"].sort
    return [] if @view_components.empty?
    pattern = /app\/views\/application\/(.*)\.html\.*/
    @view_components.map! {|f| f.scan(pattern).last.last}
  end

  def get_examples(view_component)
    @examples = Dir["app/views/application/examples/#{view_component}.html.*"]
    return false if @examples.empty?
    @examples.concat Dir["app/views/application/examples/#{view_component}--*.html.*"].sort
    pattern = /app\/views\/application\/examples\/(.*)\.html\.*/
    @examples.map! {|f| f.scan(pattern).last.last}
  end

  def get_comment(view_component)
    file = File.read("app/views/application/#{view_component}.html.slim")
    results = file.scan(/\/ jumbotron: (.*)$/)
    (results.empty?) ? false : (results[0][0])
  end
end
