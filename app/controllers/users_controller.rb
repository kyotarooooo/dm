class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@currentUserEntry = Entry.where(user_id: current_user.id)
		@userEntry = Entry.where(user_id: @user.id)
		if @user.id == current_user.id
		else
			#多分ここの部分で”すでにチャットしていたら@isRoomをtrueを入れるみたいなことをやっている”
			@currentUserEntry.each do |cu|
				@userEntry.each do |u|
					if cu.room_id == u.room_id then
						@isRoom = true
						@roomId = cu.room_id
					end
				end
			end
		#@isRoomにtrueが入ってなかったら@roomと@entryを新しく作る
		if @isRoom
		else
		 @room = Room.new
		 @entry = Entry.new
		end
		end
	end

	def search
		@users = User.search(params[:search])
	end
end
