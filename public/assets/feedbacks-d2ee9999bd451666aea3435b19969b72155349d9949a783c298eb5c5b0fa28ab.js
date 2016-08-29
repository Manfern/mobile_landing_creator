(function() {
  var ImageCropper,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  jQuery(function() {
    return new ImageCropper();
  });

  ImageCropper = (function() {
    function ImageCropper() {
      this.updatePreview = bind(this.updatePreview, this);
      this.update = bind(this.update, this);
      $('#cropbox').Jcrop({
        aspectRatio: 1,
        setSelect: [0, 0, 320, 300],
        onSelect: this.update,
        onChange: this.update
      });
    }

    ImageCropper.prototype.update = function(coords) {
      $('#feedback_crop_x').val(coords.x);
      $('#feedback_crop_y').val(coords.y);
      $('#feedback_crop_w').val(coords.w);
      $('#feedback_crop_h').val(coords.h);
      return this.updatePreview(coords);
    };

    ImageCropper.prototype.updatePreview = function(coords) {
      return $('#preview').css({
        width: Math.round(100 / coords.w * $('#cropbox').width()) + 'px',
        height: Math.round(100 / coords.h * $('#cropbox').height()) + 'px',
        marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
        marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
      });
    };

    return ImageCropper;

  })();

}).call(this);
