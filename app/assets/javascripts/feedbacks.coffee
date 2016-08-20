# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  event.preventDefault()
  new ImageCropper()

class ImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 320, 300]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#feedback_crop_x').val(coords.x)
    $('#feedback_crop_y').val(coords.y)
    $('#feedback_crop_w').val(coords.w)
    $('#feedback_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
