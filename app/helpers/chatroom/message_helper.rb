module Chatroom
	module MessageHelper
		def new_communication(msg=nil)
			"<div class='message-line'>
				<div class='info-message'>
					<span class='send-time'>#{msg.username}</span>
				</div>
				<div class='info-message'>
					<span class='send-time'>#{msg.try(:send_time)}</span>
				</div>
				<span class='say'>#{sanitize(msg.try(:html_content), tags: %w(br img span p i b a), attributes: %w(id class style))}</span>
			</div>"
		end

		# Show all the communications in chatroom
		def show_communications(msgs=nil)
			msgs ||= []
			messages = msgs.collect do |msg|
			"<div class='message-line'>
				<div class='info-message'>
					<span class='send-time'>#{msg.username}</span>
				</div>
				<div class='info-message'>
					<span class='send-time'>#{msg.try(:send_time)}</span>
				</div>
				<span class='say'>#{sanitize(msg.try(:html_content), tags: %w(br img span p i b a), attributes: %w(id class style))}</span>
			</div>"
			end
			messages.join(' ')
		end
	end
end
