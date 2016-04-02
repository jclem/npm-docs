NpmDocs = require '../lib/npm-docs'
{$} = require 'atom-space-pen-views'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "NpmDocs", ->
  loadpackage = null

  beforeEach ->
    atom.workspaceView = atom.views.getView(atom.workspace)
    loadpackage = atom.packages.enablePackage("npm-docs")
    console.log loadpackage
  describe "when the npm-docs:search event is triggered", ->
    it "attaches and then detaches the view", ->
      expect($(atom.workspaceView).find('.npm-docs')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView, 'npm-docs:toggle'

      #waitsForPromise ->
        #loadpackage.activationPromise

      runs ->
        console.log loadpackage
        #console.log $(atom.workspaceView).find('.npm-docs')
        expect($(atom.workspaceView).find('.npm-docs')).toExist()
        atom.commands.dispatch atom.workspaceView, 'npm-docs:search'
        expect($(atom.workspaceView).find('.npm-docs')).not.toExist()
