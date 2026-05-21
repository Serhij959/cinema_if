document.addEventListener("click", function(event) {
  const burgerMenu = document.getElementById("burgerMenu")

  if (event.target.closest("#openBurger")) {
    burgerMenu?.classList.add("active")
  }

  if (
    event.target.closest("#closeBurger") ||
    event.target.closest("#burgerOverlay")
  ) {
    burgerMenu?.classList.remove("active")
  }

  const burgerLink = event.target.closest(".burger-link")

  if (burgerLink) {
    burgerMenu?.classList.remove("active")
  }
})