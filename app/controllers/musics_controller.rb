class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]
  # これにより、４つのアクションにset_musicで定義したものを書く必要がなくなる。
  def top
  end

  def index
  	@music = Music.new
  	@musics = Music.all.order(created_at: :desc) #降順
  end

  def show
  end

  def create
  	@music = Music.new(music_params)
  	@musics = Music.all
  	if @music.save
  	   redirect_to music_path(@music), notice: "Music was successfully created."
  	else
  	   render "index"
  	end
  end

  def edit
  end

  def update
  	if @music.update(music_params)
  	   redirect_to music_path(@music), notice: "Music was successfully update."
  	else
  	   render "edit"
  	end
  end

  def destroy
  	@music.destroy
  	redirect_to musics_path, notice: "Music was successfully destroyed."
  end

  private

  def set_music
  	@music = Music.find(params[:id])
  end

  def music_params
  	params.require(:music).permit(:title, :artist)
  end
end