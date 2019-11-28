// const tabs = document.querySelectorAll('[data-tab-target]')
// const tabContents = document.querySelectorAll('[data-tab-content]')

// tabs.forEach(tab => {
//   tab.addEventListener('click', () => {
//     const target = document.querySelector(tab.dataset.tabTarget)
//     tabContents.forEach(tabContent => {
//       console.log(tabContent)
//       tabContent.classList.remove("active")
//       tabContent.classList.style.display = "block"
//     })
//     target.classList.add("active")
//   })
// })

// evento de clicar Loved Articles - id = test1
const tab1 = document.getElementById("link1")
const tab2 = document.getElementById("link2")
tab1.addEventListener('click', () => {
  document.getElementById("try").style.display = "none"
  document.getElementById("loved").style.display = "block"
})

tab2.addEventListener('click', () => {
// evento de clicar Want to Try - id = test2
  document.getElementById("loved").style.display = "none"
  document.getElementById("try").style.display = "block"
})
