module HomeHelper

	def deletefunc
	    i = 0
	    while i<10
	    puts "I am a thread and I am deleting your files!!!"
			@documents.each do |document|
				if (Time.now - document.created_at) > 60
        document.destroy
				puts "file deleted at "
				puts Time.now
				end
			end
	    sleep(60)
	    i = i+1
			end
	end

end
