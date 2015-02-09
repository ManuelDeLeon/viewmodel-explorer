class @Client
  delayed = { }
  @delay = (time, nameOrFunc, fn) ->
    func = fn || nameOrFunc
    name = nameOrFunc if fn
    d = delayed[name] if name
    Meteor.clearTimeout d if d?
    id = Meteor.setTimeout func, time
    delayed[name] = id if name

  waited = { }
  @waitFor = (timeOrTest, testOrFunc, fn) ->
    that = this
    name = Random.id()
    waited[name] = 0 if not waited[name]
    time = if fn then timeOrTest else 1000
    test = if fn then testOrFunc else timeOrTest
    func = fn || testOrFunc
    if test()
      waited[name] = 0
      func()
    else
      if waited[name] < 30
        waited[name] += 1
        that.delay time, -> that.waitFor(time, test, func, name)

  @parentTemplate = (template) ->
    parentView = template.view.parentView
    t = null
    while parentView
      t = parentView.templateInstance() if parentView.templateInstance
      break if t
      parentView = parentView.parentView
    t