wordLabel = document.querySelector 'h1'
button = document.querySelector 'button'
textArea = document.querySelector 'textarea'
speedLabel = document.querySelector 'input'

switchView = (view)->
  if view is 1
    wordLabel.style.display = ''
    textArea.style.display = 'none'
    button.style.display = 'none'
  else
    wordLabel.style.display = 'none'
    textArea.style.display = ''
    button.style.display = ''

showText = (text, speed) ->
  index = 0
  numberOfWords = text.length
  callback = ->
    if index is numberOfWords - 1
      clearInterval timer
      switchView 2
    else
      wordLabel.innerHTML = insertRedLetter text[index]
      index++
      return
  timer = setInterval callback, speed

button.addEventListener 'click', ->
  switchView 1
  speed = ~~ 60000 / speedLabel.value
  text = textArea.value.split ' '
  showText text, speed

insertRedLetter = (word) ->
  if word.length is 1 then word
  else
    position = ~~ (word.length / 2) - 1
    output = word.substr(0, position) + '<span style="color: red">' + word[position] + '</span>' + word.substr(position + 1)
