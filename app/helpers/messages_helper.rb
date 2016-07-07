module MessagesHelper

  def return_tabs
    raw [link_to("All", messages_path(type: "", tag: params[:tag]), remote: true, class: params[:type] == "" || !params[:type] ? 'current' : ''), link_to("Video", messages_path(type: "video", tag: params[:tag]), remote: true, class: params[:type] == "video" ? 'current' : ''), link_to("Audio", messages_path(type: "audio", tag: params[:tag]), remote: true, class: params[:type] == "audio" ? 'current' : '')].join(' ')
  end

  def tag_links(tlist)
    tlist.map do |t|
      link_to t, messages_path(:tag => t), remote: true
    end.join(', ')
  end
end
