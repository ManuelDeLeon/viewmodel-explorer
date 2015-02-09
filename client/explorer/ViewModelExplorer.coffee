
Template._vm_explorer_ViewModelExplorer.created = ->
  this.vm = new ViewModel( "_vm_explorer_ViewModelExplorer",
    close: -> $.sidr('close', 'sidr')
    viewmodels: ->
      vm for vm in ViewModel.all.list() when ((not vm.template) or vm.template.indexOf("_vm_explorer_")) and not (vm.id and vm.id.indexOf("_vm_explorer_") is 0) isnt 0
  ).addHelper('viewmodels', @)

Template._vm_explorer_ViewModelExplorer.rendered = ->
  this.vm.bind @
  $('#menu-ViewModelExplorer').sidr()