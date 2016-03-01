class TopController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    Note.create(name: note_params[:name], image: note_params[:image], content: note_params[:content], user_id: current_user.id)
    @rand = Note.where( 'id >= ?', rand(Note.first.id..Note.last.id) ).first
    @notes = Note.order("created_at DESC")
    @notes2 = @notes.page(params[:page]).per(5)
  end

  def new
  end

  def create
    Note.create(name: note_params[:name], image: note_params[:image], content: note_params[:content], user_id: current_user.id)
  end

  private
    def note_params
      params.permit(:name, :image, :content, :title)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
