const initPopup = () => {
  const popupFrame = document.querySelector(".frame");
  // const footer = document.querySelector('.footer');
    console.log("Hello World")
  if (!popupFrame) return;


  const planTrip = document.querySelector(".open");
  planTrip.addEventListener('click', (event) => {

    popupFrame.classList.remove("d-none");
    // popupFrame.style.display = block
    // footer.style.zIndex = "4";
  })

  const close = document.querySelector('.close');
  close.addEventListener('click', (event) => {
    popupFrame.classList.add("d-none");
    // popupFrame.style.opacity = none
    // footer.style.zIndex = "6";
  })
}

export { initPopup }
