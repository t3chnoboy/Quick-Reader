// Generated by CoffeeScript 1.7.1
(function() {
  var button, insertRedLetter, showText, speedLabel, switchView, textArea, wordLabel;

  wordLabel = document.querySelector('h1');

  button = document.querySelector('button');

  textArea = document.querySelector('textarea');

  speedLabel = document.querySelector('input');

  switchView = function(view) {
    if (view === 1) {
      wordLabel.style.display = '';
      textArea.style.display = 'none';
      return button.style.display = 'none';
    } else {
      wordLabel.style.display = 'none';
      textArea.style.display = '';
      return button.style.display = '';
    }
  };

  showText = function(text, speed) {
    var callback, index, numberOfWords, timer;
    index = 0;
    numberOfWords = text.length;
    callback = function() {
      if (index === numberOfWords - 1) {
        clearInterval(timer);
        return switchView(2);
      } else {
        wordLabel.innerHTML = insertRedLetter(text[index]);
        index++;
      }
    };
    return timer = setInterval(callback, speed);
  };

  button.addEventListener('click', function() {
    var speed, text;
    switchView(1);
    speed = ~~60000 / speedLabel.value;
    text = textArea.value.split(' ');
    return showText(text, speed);
  });

  insertRedLetter = function(word) {
    var output, position;
    if (word.length === 1) {
      return word;
    } else {
      position = ~~(word.length / 2) - 1;
      return output = word.substr(0, position) + '<span style="color: red">' + word[position] + '</span>' + word.substr(position + 1);
    }
  };

}).call(this);
