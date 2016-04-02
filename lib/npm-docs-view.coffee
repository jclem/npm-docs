{ScrollView} = require 'atom-space-pen-views'

module.exports =
class NpmDocsView extends ScrollView
  atom.deserializers.add(this)

  @deserialize: ({path})->
    new NpmDocsView(path)

  @content: ->
    @div class: 'npm-docs native-key-bindings', tabindex: -1

  constructor: (@path) ->
    super
    @handleEvents()

  renderContents: (html) ->
    @html(html)

  serialize: ->
    deserializer: 'NpmDocsView'
    path: @path

  handleEvents: ->
    @on 'core:move-up',  this,   => @scrollUp()
    @on 'core:move-down',this,  => @scrollDown()

  # Tear down any state and detach
  destroy: ->
    @off('core:move-up',this)
    @off('core:move-down',this)

  getTitle: ->
    "npm-docs: #{@path}"
