document.addEventListener('turbolinks:load', function () {
  let textBox = document.querySelector('#apology-content textarea')
  let formInputArea = document.querySelector('#apology-content')
  let characterMax = 210
  let submitButton = document.querySelector('input[type=submit]')

  let displayRemainingCharacters = function(){
    let currentCount = textBox.value.length
    let remainingCharacters = characterMax - currentCount

    document.querySelector('#character-count').textContent = remainingCharacters

    if (currentCount <= characterMax) {
      formInputArea.classList.remove('exceeded-limit')
      submitButton.disabled = false
      submitButton.classList.remove('btn-secondary')
    } else {
      formInputArea.classList.add('exceeded-limit')
      submitButton.disabled = true
      submitButton.classList.add('btn-secondary')

    }
  }
  document.addEventListener('keyup', displayRemainingCharacters)
});
