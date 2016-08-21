(function() {
  var ImageCropper,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  jQuery(function() {
    event.preventDefault();
    return new ImageCropper();
  });

  ImageCropper = (function() {
    function ImageCropper() {
      this.updatePreview = bind(this.updatePreview, this);
      this.update = bind(this.update, this);
      $('#cropbox').Jcrop({
        aspectRatio: 1,
        setSelect: [0, 0, 320, 320],
        onSelect: this.update,
        onChange: this.update
      });
    }

    ImageCropper.prototype.update = function(coords) {
      $('#offer_crop_x').val(coords.x);
      $('#offer_crop_y').val(coords.y);
      $('#offer_crop_w').val(coords.w);
      $('#offer_crop_h').val(coords.h);
      return this.updatePreview(coords);
    };

    ImageCropper.prototype.updatePreview = function(coords) {
      return $('#preview').css({
        width: Math.round(150 / coords.w * $('#cropbox').width()) + 'px',
        height: Math.round(150 / coords.h * $('#cropbox').height()) + 'px',
        marginLeft: '-' + Math.round(150 / coords.w * coords.x) + 'px',
        marginTop: '-' + Math.round(150 / coords.h * coords.y) + 'px'
      });
    };

    return ImageCropper;

  })();

}).call(this);
