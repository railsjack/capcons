
window.stringSorter = (a, b) ->
  if stripTags(a.toLowerCase()) < stripTags(b.toLowerCase())
    -1
  else
    1

window.numberSorter = (a, b) ->
  if a < b
    -1
  else
    1

window.stripTags = (html) ->
  $.trim $("<p>" + html + "</P>").text()


window.get_data_p = (url, data, fn) ->
  $.post url, data, ((response) ->
    fn response
    return
  ), "json"
  return

window.get_data_g = (url, fn) ->
  $.get url, ((response) ->
    fn response
    return
  ), "json"
  return
