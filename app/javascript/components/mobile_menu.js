const  mobileMenu = () => {
  const trigger = document.getElementById('menu-trigger');
  const action = document.getElementById('menu-action');
  trigger.addEventListener('click', () => {
    if (action.classList.contains('mobile-visible')) {
      action.classList.remove('mobile-visible');
      action.classList.add('mobile-not-visible');
    }
    else {
      action.classList.remove('mobile-not-visible');
      action.classList.add('mobile-visible');
    }
  });
}

export { mobileMenu }