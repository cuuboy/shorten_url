class ShortcutsController < ApplicationController
  def index
    @shortcuts = Shortcut.all
  end

  def new
    @shortcut = Shortcut.new
  end

  def show
    @shortcut = Shortcut.find(params[:id])
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
    @shortcut = Shortcut.find_by(shorten_url: params[:shorten_url])


  end

  private

  def shortcut_params
    params.require(:shortcut).permit(:name, :note, :original_url)
  end
end