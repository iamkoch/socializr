//= require_directory ./frameworks
//= require templates

$(document).ready () ->
  doSubmit = () ->
    searchTerm = $("#q").val()
    $results = $("#results")
    $results.html("<div/>").addClass("loading")
    $.ajax
      url: "/search/" + searchTerm,
      dataType: 'json',
      success: (response) ->
        if response
          rendered = Mustache.to_html(templates.results,response,templates)
          $results.append(rendered).removeClass("loading")
  $("#q").keypress (e) ->
    if e.which == 13
      doSubmit()
  $("#s").click () ->
    doSubmit()
