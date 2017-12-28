module Chatroom
	class MessagesController < ApplicationController
		skip_before_action :verify_authenticity_token, only: [:create]
		before_action :define_chatting
		# GET /messages
		def index
			@messages = Message.all
		end

		# POST /messages
		# POST /messages.json
		def create
			message = message_params
			@message = Message.create!(message)
		end

		private
			# Never trust parameters from the scary internet, only allow the white list through.
			def message_params
				params.require(:message).permit(:content)
			end

			def define_chatting
				@chatting = true;
			end
	end
end
