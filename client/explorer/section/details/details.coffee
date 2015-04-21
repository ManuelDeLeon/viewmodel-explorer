
Template._vm_explorer_details.onCreated ->
  this.vm = new ViewModel(this.data)

Template._vm_explorer_details.onRendered ->
  this.vm.extend(
    value: ->
      if (@isProperty() or @includeFunction()) and @vm()[@name()]
        try
          @vm()[@name()]()
        catch
          ''
      else
        ''
    includeFunction: false
  )
  this.vm.bind @
