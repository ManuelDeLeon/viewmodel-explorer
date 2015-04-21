templateCounter = {}
anonCounter = 0

Template._vm_explorer_section.onCreated ->
  name = if this.data.id and this.data.vm._vm_hasId
    this.data.id
  else if this.data.template
    counter = templateCounter[this.data.template] or 0
    counter += 1
    templateCounter[this.data.template] = counter
    this.data.template + " " + counter
  else
    anonCounter += 1
    "Anonymous " + anonCounter

  this.properties = (p for p of @data.vm when p not in @data.vm._vm_reservedWords).map (p) =>
    name: p
    vm: @data.vm
    isProperty: p in @data.vm._vm_properties
    section: name

  this.vm = new ViewModel(this.data).extend(
    name: name
    properties: -> Template.instance().properties
  ).addHelper('properties', @)


Template._vm_explorer_section.onRendered ->
  this.vm.bind @
  this.$(".section").accordion(
    header: "h3"
    collapsible: true
    active: false
  )