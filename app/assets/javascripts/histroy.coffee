$(document).on 'turbolinks:load', ->
  $(this).on 'click', 'a[data-remote=true]', ->
    history.pushState {}, '', $(this).attr('href')

  $(window).on 'popstate', ->
    $.getScript(location.href)

  $('#filterCont').on 'submit', ->
    url = $(this).attr('action')
    url += '?' + $(this).serialize()
    history.pushState {}, '', url
