const animateOnClick = () => {
  const btn = document.getElementById('bg-black-click')
  if (btn) {
    btn.addEventListener('click', (event) => {
      event.currentTarget.style.transition = '.2s'
      event.currentTarget.style.backgroundColor = 'black'
      event.currentTarget.style.color = 'white'
    })
  }
}

export { animateOnClick }
