window.addEventListener('load',function(){
  const tax_input = document.getElementById("add-tax-price");
  const price = document.getElementById("item-price");
  const profit = document.getElementById("profit")
  
  price.addEventListener('input',function(){
    tax_input.textContent = Math.floor(price.value * 0.1)
    profit.textContent = Math.floor(price.value - price.value * 0.1)

  })
})