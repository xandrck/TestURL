class UrlsController < ApplicationController
  before_action :set_url, only: %i[show info]

  def new
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      flash[:notice] = 'Url successfully created'
      redirect_to root_path
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append('errors', partial: 'shared/error_messages', locals: { object: @url }) }
        format.html { render :new }
      end
    end
  end

  def show
    create_log

    render 'redirect_external'
  end

  def info; end

  private

  def url_params
    params.require(:url).permit(:full_path)
  end

  def set_url
    @url = Url.find_by_token(params[:token])
  end

  def create_log
    @url.url_logs.create(ip: request.remote_ip)
  end
end
