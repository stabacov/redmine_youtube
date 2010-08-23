require 'redmine'

Redmine::Plugin.register :redmine_youtube do
	name 'Redmine Youtube wiki macro plugin'
	author 'J.W.Marsden'
	description 'This plugin adds a youtube macro to Redmine that allows the posting of YouTube videos.'
	version '0.0.1'
	url 'http://jwm.slavitica.net/p/projects/redmine-youtube'
	author_url 'http://jwm.slavitica.net'
	
	Redmine::WikiFormatting::Macros.register do
		desc = "Redmine Youtube Macro! The correct usage is {{youtube(&lt;video key&gt;,[&lt;width&gt;,&lt;height&gt;])}}. eg {{youtube(4N3N1MlvVc4)}} or {{youtube(4N3N1MlvVc4,800,600)}}</pre>"
		# Register youtube macro
		macro :youtube do |youtube_wiki_content, args|
			RAILS_DEFAULT_LOGGER.info "Youtube Plugin (#{args.join(",")})"
			v = ""
			h = 400
			w = 600
			if args.length >= 1
				v = args[0]
				if args.length == 3
					w = args[1]
					h = args[2]
				end
				out = <<"EOF"
<object width="#{w}" height="#{h}">
  <param name="movie" value="http://www.youtube.com/v/#{v}?rel=1&fs=1"></param>
  <param name="allowFullScreen" value="true"></param>
  <param name="allowScriptAccess" value="always"></param>
  <embed src="http://www.youtube.com/v/#{v}?rel=1&fs=1"
    type="application/x-shockwave-flash"
    allowscriptaccess="always"
    width="#{w}" height="#{h}" 
    allowfullscreen="true"></embed>
</object>
EOF
			else
				out = "<pre>Error in youtube macro. The correct usage is {{youtube(&lt;video key&gt;,[&lt;width&gt;,&lt;height&gt;])}}. \r\neg {{youtube(4N3N1MlvVc4)}} or {{youtube(4N3N1MlvVc4,800,600)}}</pre>"
			end

		end
	end
	
	
end
