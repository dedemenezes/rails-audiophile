const  mobileMenu = () => {
  const trigger = document.getElementById('menu-trigger');
  const action = document.getElementById('menu-action');
  trigger.addEventListener('click', () => {
    if (action.classList.contains('display-grid')) {
      action.classList.remove('display-grid');
      action.classList.add('not-visible');
    }
    else {
      action.classList.remove('not-visible');
      action.classList.add('display-grid');
    }
  });
}

export { mobileMenu }