class ReportListController < ApplicationController
  def index
    @reports = Dir.glob("generated-files/*.html")
  end

  def show
    @report = render_to_body file: Dir.glob("#{params[:id]}.html").first
  end

end
