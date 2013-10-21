window.unity3dLoader = (config, file) ->
  load = () -> $ ->
    window.jQuery = $
    u = new UnityObject2 config
    missingScreen = $('#unityPlayer').find('.missing')
    brokenScreen = $('#unityPlayer').find('.broken')
    unsupportedScreen = $('#unityPlayer').find('.unsupported')
    missingScreen.hide()
    brokenScreen.hide()
    unsupportedScreen.hide()

    u.observeProgress( (progress) ->
      console.log(progress.pluginStatus)
      switch progress.pluginStatus
        when 'broken'
          brokenScreen.find('a').click( (e) ->
            e.stopPropagation()
            e.preventDefault()
            e.installPlugin()
            return false
          )
          brokenScreen.show()
        when 'missing'
          missingScreen.find('a').click( (e) ->
            e.stopPropagation()
            e.preventDefault()
            e.installPlugin()
            return false
          )
          missingScreen.show()
        when 'unsupported'
          unsupportedScreen.show()
        when 'first'
          return true
    )

    u.initPlugin($('#unityPlayer')[0], file)

  Modernizr.load([{
    load: 'https://ssl-webplayer.unity3d.com/download_webplayer-3.x/3.0/uo/UnityObject2.js'
    complete: () -> load()
  }])
