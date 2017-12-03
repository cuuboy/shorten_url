class ShortcutsController < ApplicationController
  def index
    @shortcuts = Shortcut.all
  end

  def new
    @shortcut = Shortcut.new
  end

  def show
    @shortcut = Shortcut.find(params[:id])
    @visits = @shortcut.visits.all.order(created_at: :desc)
  end

  def create
    @shortcut = Shortcut.new(shortcut_params)
    @shortcut.short_url = ShortenUrlService.call(@shortcut.original_url)

    if @shortcut.save
      redirect_to shortcut_url @shortcut
    else
      render action: :new, error: "Create shortcut went wrong"
    end
  end

  def redirect
    shortcut = Shortcut.find_by(short_url: params[:short_url])

    env = request.env

    shortcut.visits.
      create(
        ip: request.remote_ip,
        user_agent: env['HTTP_USER_AGENT'],
        cookie: env['HTTP_COOKIE'],
        path_info: env['PATH_INFO'],
        query_string: env['HTTP_USER_AGENT'],
        referer: request.referer
      )

    redirect_to shortcut.original_url
  end

  private

  def shortcut_params
    params.require(:shortcut).permit(:name, :note, :original_url)
  end
end