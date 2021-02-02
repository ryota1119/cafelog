document.addEventListener("turbolinks:load", function () {
  $(function(){
    var dataBox = new DataTransfer();
    var file_field = document.querySelector('input[type=file]')
    $('#img-file').on("change", function(e){
      var files = $('input[type="file"]').prop('files')[0];
      $.each(this.files, function(i, file){
        var fileReader = new FileReader();
        dataBox.items.add(file)
        file_field.files = dataBox.files
        console.log(file_field.files);
        var num = $('.shop-image').length + 1 + i
        fileReader.readAsDataURL(file);
        if (num == 10){
          $('#image-box__container').css('display', 'none')
        }
        fileReader.onloadend = function() {
          var src = fileReader.result
          var html= `<div class='shop-image' data-image="${file.name}">
                      <div class=' shop-image__content'>
                        <div class='shop-image__content--icon'>
                          <img src=${src} width="93" height="100" >
                        </div>
                      </div>
                      <div class='shop-image__operetion'>
                        <div class='shop-image__operetion--delete'>削除</div>
                      </div>
                    </div>`
          $('#image-box__container').before(html);
        };
        $('#image-box__container').attr('class', `shop-num-${num}`)
      });
    });

    $(document).on("click", '.shop-image__operetion--delete', function(){
      var target_image = $(this).parent().parent()
      var target_name = $(target_image).data('image')
      if(file_field.files.length==1){
        $('input[type=file]').val(null)
        dataBox.clearData();
      } else{
        $.each(file_field.files, function(i,input){
          if(input.name==target_name){
            dataBox.items.remove(i)
          }
        })
        file_field.files = dataBox.files
      }
      target_image.remove()
      var num = $('.shop-image').length
      $('#image-box__container').show()
      $('#image-box__container').attr('class', `shop-num-${num}`)
    })
  });
});