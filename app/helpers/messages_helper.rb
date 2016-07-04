module MessagesHelper

  def tag_links(tlist)
    tlist.map do |t|
      link_to t, messages_path(:tag => t)
    end.join(', ')
  end
end
