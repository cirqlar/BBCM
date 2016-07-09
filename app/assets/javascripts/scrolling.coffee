$(document).on "turbolinks:load", ->
  if $('#scrolling').size() > 0
    $(window).on 'scroll', ->
      next_url = $('.pagination a.next_page').attr('href')
      if next_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<div id="loading"></div>')
        $.getScript next_url
        return
      return
