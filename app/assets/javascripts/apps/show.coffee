class AppShowModel
  constructor: (app, releaseable) ->
    if app?
      @noteAttachModel = new Precision.models.NoteAttachModel(app.id, 'App')
      @readmeDisplay = Precision.md.render(app.readme)

    if releaseable
      @appReleaseModel = new Precision.models.AppReleaseModel(app.dxid)

#########################################################
#
#
# PALOMA CONTROLLER
#
#
#########################################################

AppsController = Paloma.controller('Apps',
  show: ->
    $container = $("body main")
    viewModel = new AppShowModel(@params.app, @params.releaseable)

    ko.applyBindings(viewModel, $container[0])

    $container.find('[data-toggle="tooltip"]').tooltip({
      container: 'body'
    })
)
