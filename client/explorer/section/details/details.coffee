
Template._vm_explorer_details.created = ->
  this.vm = new ViewModel("_vm_explorer_details_#{this.data.section}_#{this.data.name}", this.data).extend(
    value: -> if @isProperty() or @includeFunction() then @vm()[@name()]() else ''
    includeFunction: false
  )

Template._vm_explorer_details.rendered = ->
  this.vm.bind @
