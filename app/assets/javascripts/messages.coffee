$(document).on "turbolinks:load", ->
  $('video, audio').mediaelementplayer
    plugins: ['flash', 'silverlight'],
    pluginPath: "/uploads/",
    flashName: "flashmediaelement.swf",
    silverlightName: "silverlightmediaelement.xap"
