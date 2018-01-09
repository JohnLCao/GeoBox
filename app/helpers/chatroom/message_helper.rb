module Chatroom
	module MessageHelper
		def new_communication(msg=nil)
			"<div class='container'>
				<div class='info-message card-header'>
					<span class='send-time'><strong>#{msg.username}</strong></span>
					<span class='send-time'>#{msg.try(:send_time)}</span>
				</div>
				<div class='say card-body'>
					<p class='card-text'>
						#{sanitize(msg.try(:html_content), tags: %w(br img span p i b a), attributes: %w(id class style src))}
					</p>
				</div>
			</div>
			<br>"
		end

		# Show all the communications in chatroom
		def show_communications(msgs=nil)
			msgs ||= []
			messages = msgs.collect do |msg|
			"<div class='container'>
				<div class='info-message card-header'>
					<span class='send-time'><strong>#{msg.username}</strong></span>
					<span class='send-time'>#{msg.try(:send_time)}</span>
				</div>
				<div class='say card-body'>
					<p class='card-text'>
						#{sanitize(msg.try(:html_content), tags: %w(br img span p i b a), attributes: %w(id class style src))}
					</p>
				</div>
			</div>
			<br>"
			end
			messages.join(' ')
		end
	end
end
