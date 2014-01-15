###
@
#Model
@category Model
Component for data/model behavior.
@trigger DataChange - When any data on the model has changed.
@trigger DataChange[key] - When the specific key on the model has changed.
@trigger DataChange[key.key] - The nested key value has changed.
@example
~~~
Crafty.c('Person', {
defaults: {name: 'Fox'}
});
person = Crafty.m('Person').setup({name: 'blainesch'});
~~~
###
Crafty.c "Model",
  init: ->
    @defaults = @defaults or {}
    @attributes = @extend.call(@attributes or {}, @defaults)
    @original = @attributes
    @changed = @changed or []
    @bind "DataChange", @_changed_attributes
    @bind "DataChange", @_changed_triggers


  ###
  @
  #.setup
  @comp Model
  Sets up the current model without triggering events.

  @example
  ~~~
  person.setup({foo: 1, bar: {baz: 2}});
  ~~~
  ###
  setup: (data) ->
    @set.apply @, data,
      silent: true
    @


  ###
  Fires more specific `DataChange` events.

  For instance a `DataChange[name]` may get fired when you
  update the name data attribute on the model.
  ###
  _changed_triggers: (data, options) ->
    options = Crafty.extend.call(
      pre: ""
    , options)
    for key of data
      @trigger "DataChange[" + options.pre + key + "]", data[key]
      if data[key].constructor.name is "Object"
        @_changed_triggers data[key],
          pre: options.pre + key + "."



  ###
  Pushes all top-levle changed attribute names to the
  changed array.
  ###
  _changed_attributes: (data) ->
    for key of data
      @changed.push key
    @


  ###
  @
  #.data
  @comp Model
  Delegates to the appropriate get/set method.

  @example
  ~~~
  person.data('name', 'Foxxy');
  person.data('name'); // 'Foxxy'
  ~~~

  @see .get
  @see .set
  ###
  data: ->
    if arguments.length is 1 and typeof arguments[0] is "string"
      @get.apply @, arguments
    else
      @set.apply @, arguments


  ###
  @
  #.get
  @comp Model
  Getter method for data on the model.

  @example
  ~~~
  person.get('name'); // Foxxy
  person.get('contact'); // {email: 'fox@example.com'}
  person.get('contact.email'); // fox@example.com
  ~~~
  ###
  get: (key, context) ->
    context = @attributes  if typeof context is "undefined" or context is null
    if key.indexOf(".") > -1
      keys = key.split(".")
      first = keys.shift()
      subkey = keys.join(".")
      @get keys.join("."), context[first]
    else
      context[key] or null


  ###
  @
  #.set
  @comp Model
  Main setter function for data attributes.

  Options:

  `silent`: If you want to prevent it from firing events.

  `recursive`: If you pass in an object you could overwrite
  sibling keys, @ recursively merges instead of just
  merging it. This is `false` by default, unless you are
  using dot notation `name.first`.

  @example
  ~~~
  person.set('name', 'Foxxy', {silent: true});
  person.set('name', 'Foxxy');
  person.set({name: 'Foxxy'}, {silent: true});
  person.set({name: 'Foxxy'});
  person.set('name.first', 'Foxxy');
  ~~~
  ###
  set: ->
    args = @_set_normalize_arguments.apply(@, arguments)
    options = args.options
    data = args.data
    options = Crafty.extend.call(
      recursive: typeof arguments[0] is "string" and arguments[0].indexOf(".") > -1
      silent: false
    , options)
    @trigger "DataChange", data  unless options.silent
    if options.recursive
      @attributes = @_recursive_extend(data, @attributes)
    else
      @extend.call @attributes, data
    @


  ###
  Normalizes the arguments for the `set` method.

  The set method accepts a lot of various inputs it's necessary
  to move the argument logic out to keep it single-responsibility.
  ###
  _set_normalize_arguments: ->
    length = arguments.length
    if length is 3 or (length is 2 and typeof arguments[0] is "string")
      data = @_set_create_object.apply(@, arguments)
      options = arguments[2] or {}
    else
      data = arguments[0] or {}
      options = arguments[1] or {}
    data: data
    options: options


  ###
  If you are setting a key of 'foo.bar' or 'bar', this creates
  the appropriate object for you to merge with the current
  attributes.
  ###
  _set_create_object: (key, value) ->
    data = {}
    if key.indexOf(".") > -1
      keys = key.split(".")
      first = keys.shift()
      subkey = keys.join(".")
      data[first] = @_set_create_object(subkey, value)
    else
      data[key] = value
    data


  ###
  Recursively puts `new_data` into `original_data`.
  ###
  _recursive_extend: (new_data, original_data) ->
    for key of new_data
      if new_data[key].constructor.name is "Object"
        original_data[key] = @_recursive_extend(new_data[key], original_data[key])
      else
        original_data[key] = new_data[key]
    original_data


  ###
  @
  #.is_dirty
  @comp Model
  Helps determine when data or the entire component is "dirty" or has changed attributes.

  @example
  ~~~
  person = Crafty.e('DirtyData').setup({name: 'Fox', age: 24})
  person.is_dirty() // false
  person.is_dirty('name') // false

  person.set('name', 'Lucky');
  person.is_dirty(); // true
  person.is_dirty('name'); // true
  person.is_dirty('age'); // false
  person.changed; // ['name']
  ~~~
  ###
  is_dirty: (key) ->
    if arguments.length is 0
      !!@changed.length
    else
      @changed.indexOf(key) > -1


###
@
#Crafty.m
@category Core
Model entity helper.
@see Model
###
Crafty.extend m: (name) ->
  @e name + ", Model"
