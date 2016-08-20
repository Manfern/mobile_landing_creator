# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  event.preventDefault()
  new IconCropper()

class IconCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 320, 320]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#advantage_crop_x').val(coords.x)
    $('#advantage_crop_y').val(coords.y)
    $('#advantage_crop_w').val(coords.w)
    $('#advantage_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(80/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(80/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(80/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(80/coords.h * coords.y) + 'px'
