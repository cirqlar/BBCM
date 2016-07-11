$(document).on "turbolinks:load", ->
  $('.pagination').hide()
  if $('#scrolling').size() > 0
    $(window).on 'scroll', ->
      next_url = $('.pagination a.next_page').attr('href')
      if next_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('#scrolling').html('<div id="preScroll"><img src="/img/loader.gif" alt="prescroll" /></div>')
        $.getScript next_url
        return
      return
