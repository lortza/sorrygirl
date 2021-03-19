document.addEventListener('DOMContentLoaded', function () {
  let characterMax = document.querySelector('#character-count').innerHTML
  let textBox = document.querySelector('#apology-form textarea')
  let formInputArea = document.querySelector('#apology-form')
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
