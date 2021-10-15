// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$( document ).on('turbolinks:load', function() {
    $('#cliked').on('click', function(e) {
        setClick(e);
    });
  })

  function setClick(e){
    var id = $(e.currentTarget).attr("data-id");
    $.ajax({
      url: "/set_click",
      type: "GET",
      data: {
          click: true,
          postId: id,
      },
      success: function (response) {
        alert("Your cliked succeesuly! :)");
        console.log('success')
      },
      error: function (error) {
        console.log('error')
      }
    });
  };