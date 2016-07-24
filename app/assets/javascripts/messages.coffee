$(document).on "turbolinks:load", ->
  $('video, audio').mediaelementplayer
    plugins: ['flash', 'silverlight'],
    pluginPath: "/deps/",
    flashName: "flashmediaelement.swf",
    silverlightName: "silverlightmediaelement.xap"
