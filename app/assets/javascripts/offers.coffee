# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  new ImageCropper()

class ImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 320, 320]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_crop_x').val(coords.x)
    $('#user_crop_y').val(coords.y)
    $('#user_crop_w').val(coords.w)
    $('#user_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(200/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(200/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(200/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(200/coords.h * coords.y) + 'px'
