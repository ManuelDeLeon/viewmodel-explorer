Session.setDefault('_vm_explorer_Show', false)

Template._vm_explorer_ViewModelExplorer.helpers
  viewmodels: ->
    vm for vm in ViewModel.all.list() when not vm.template or not ~vm.template.indexOf("_vm_explorer_")

Template._vm_explorer_ViewModelExplorer.onCreated ->
  document.onkeydown = (e) ->
    evtobj = window.event or e
    if (evtobj.keyCode == 69 && evtobj.ctrlKey && evtobj.shiftKey)
      Session.set('_vm_explorer_Show', not Session.get('_vm_explorer_Show'))
      $.sidr()

Template._vm_explorer_ViewModelExplorer.onRendered ->
  $('#sidr').sidr()
  $.sidr('open') if Session.get('_vm_explorer_Show')



