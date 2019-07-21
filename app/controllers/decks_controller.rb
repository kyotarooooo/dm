class DecksController < ApplicationController

	def new
		@deck = Deck.new
	end

	def create
		@deck = Deck.new(deck_params)
		@deck.user_id = current_user.id
		if @deck.save!
			flash[:notice] = "投稿しました"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def index
		@decks = Deck.all
	end

	def show
		@deck = Deck.find(params[:id])
		@like = Like.new
	end

	private
	def deck_params
		params.require(:deck).permit(:user_id, :deck_name, :body)
	end
end
