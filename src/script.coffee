wordLabel = document.querySelector 'h1'
button = document.querySelector 'button'
textArea = document.querySelector 'textarea'

showText = (text) ->
  window.setTimeout ->
    switchView 2
  , 5000
  for word in text
    wordLabel.innerHTML = insertRedLetter word

button.addEventListener 'click', ->
  switchView 1
  showText textArea.value.split ' '

switchView = (view)->
  if view is 1
    wordLabel.style.display = ''
    textArea.style.display = 'none'
    button.style.display = 'none'
  else
    wordLabel.style.display = 'none'
    textArea.style.display = ''
    button.style.display = ''

insertRedLetter = (word) ->
  position = word.length / 2 - 1
  output = word.substr(0, position) + '<span style="color: red">' + word[position] + '</span>' + word.substr(position + 1)
