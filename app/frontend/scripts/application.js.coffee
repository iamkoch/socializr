//= require_directory ./frameworks
//= require templates

$(document).ready () ->
  $("#s").click () ->
    searchTerm = $("#q").val()
    $.ajax
      url: "/search/" + searchTerm,
      dataType: 'json',
      success: (response) ->
        if response
          rendered = Mustache.to_html(templates.results,response,templates)
          $("#results").html(rendered)