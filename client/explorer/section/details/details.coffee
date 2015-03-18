
Template._vm_explorer_details.created = ->
  this.vm = new ViewModel("_vm_explorer_details_#{this.data.section}_#{this.data.name}", this.data)

Template._vm_explorer_details.rendered = ->
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
