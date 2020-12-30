function calcPrice() {
  const price = document.getElementById('item-price')
  const tax = document.getElementById('add-tax-price')
  const profit = document.getElementById('profit')
  
  if(price != null){
    tax.innerHTML = Math.floor(price.value * 0.1)
    profit.innerHTML = price.value - tax.innerHTML
  }
}

setInterval(calcPrice, 100)

