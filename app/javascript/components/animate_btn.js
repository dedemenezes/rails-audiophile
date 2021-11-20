const animateOnClick = () => {
  const btn = document.getElementById('bg-black-click')
  if (btn) {
    btn.addEventListener('mousedown', (event) => {
      if (event.button === 0){
        event.currentTarget.style.transition = '.2s'
        event.currentTarget.style.backgroundColor = 'black'
      }
    })
    btn.addEventListener('mouseup', (event) => {
      if (event.button === 0) {
        event.currentTarget.style.transition = '.2s'
        event.currentTarget.style.backgroundColor = '#dc7d4ee3'
      }
    })
  }
}

export { animateOnClick }
