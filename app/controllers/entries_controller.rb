class EntriesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = current_user.entries.build(entries_params)
    if @entry.save
      flash.now[:success] = "Entry created successful!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @entry.destroy
    flash.now[:seccess] = "Entry deleted!"
    redirect_to request.referrer || root_url
  end

  private
    def entries_params
      params.require(:entry).permit(:title, :body)
    end

    def correct_user
      @entry =current_user.entries.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end
end
