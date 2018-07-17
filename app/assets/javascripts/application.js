// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require_tree .
//= require moment
//= require bootstrap-datetimepicker

document.addEventListener("DOMContentLoaded", function(event){
	$("#city_search").on("keyup", function(e){
		e.preventDefault();

		$.ajax({
		url: "listings/search",
	   	type: "POST",
	   	data: $(this).serialize(),
	   	dataType: "json",
	   	success: function(data) {
	   		
	   		let titles = document.getElementById("cities")
	   		titles.innerHTML = ""

	   		data.forEach(function(listing){	
	   			let option = document.createElement("option")
	   			option.value = listing.area
	   			cities.append(option)
	   		})
	   	}
		})
	})
});

// $(function() {
//     /* Convenience for forms or links that return HTML from a remote ajax call.
//     The returned markup will be inserted into the element id specified.
//      */
//     $('form[data-update-target]').on('keypress', function(evt, data) {
//         var target = $(this).data('update-target');
//         $.ajax({url: "/listings/search",
// 	   	type: "post",
// 	   	dataType: "script",
// 	   	success: function() {
// 	   	console.log("OK")
// 	   	},
// 	   	error: function() {
// 	   	console.log("Error")}
// 		}).html(data);
//     });
// });



