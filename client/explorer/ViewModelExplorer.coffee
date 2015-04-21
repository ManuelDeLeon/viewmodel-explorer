Session.setDefault('_vm_explorer_Show', false)
Template._vm_explorer_ViewModelExplorer.viewmodel
  close: ->
    Session.set('_vm_explorer_Show', false)
    $.sidr('close')
  viewmodels: ->
    vm for vm in ViewModel.all.list() when not ~vm.template.indexOf("_vm_explorer_")
  onCreated: ->
    document.onkeydown = (e) ->
      evtobj = window.event or e
      if (evtobj.keyCode == 69 && evtobj.ctrlKey && evtobj.shiftKey)
        Session.set('_vm_explorer_Show', not Session.get('_vm_explorer_Show'))
        $.sidr()
  onRendered: ->
    $('#sidr').sidr()
    $.sidr('open') if Session.get('_vm_explorer_Show')
, 'viewmodels'


