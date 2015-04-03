$(document).ready(function() {

  // //create
  // $(".new-photo-form").on("submit", function(event){
  //   event.preventDefault();
  //   var formData =$(this).serialize();
  //   var url = $(this).attr("action")
  //   var request = $.ajax({
  //     type: "POST",
  //     url: url,
  //     data: formData,
  //   });

  //   request.done(function(response){
  //     console.log(response)
  //     $(".photos").append(response)
  //   })
  // });


  // // Delete
  // $(".photos").on("click", ".delete-photo", function(event){
  //   event.preventDefault();
  //   var photoNode = $(this).closest('.photo');
  //   var photoId = photoNode.attr('data-photo-id');
  //   var request = $.ajax({
  //     type: "DELETE",
  //     url: "/photo/"+photoId,
  //   });
  //   request.done(function(response){
  //     eventNode.remove();
  //   })
  // });
});
