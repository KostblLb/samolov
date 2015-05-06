`import Ember from "ember";` 
 
FileField = Ember.TextField.extend
  type: 'file'
  attributeBindings: ['name', 'file']
  file: null
  object: null

  fileUpload: (file, attr, object)->
    reader = new FileReader()
    reader.onloadend = (e)=>
      fileToUpload = e.target.result
      Ember.run =>
        object.set(attr, fileToUpload)
        object.set("#{attr}_name", file.name)
    return reader.readAsDataURL(file)

  change: (evt) ->
    input = evt.target

    # We're using a single upload, but multiple could be
    # supported by adding `multiple` on the input element
    # and iterating over the files list here.
    if input.files && input.files[0]
      @file
      @fileUpload(input.files[0], @get('name'), @get('object'))
 
`export default FileField;`
