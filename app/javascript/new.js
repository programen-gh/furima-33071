if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  function calcPrice() {
    const price = document.getElementById('item-price')
    const tax = document.getElementById('add-tax-price')
    const profit = document.getElementById('profit')
      
    price.addEventListener('input', () => {
      tax.innerHTML = Math.floor(price.value * 0.1)
      profit.innerHTML = price.value - tax.innerHTML
    })
  }
  
  window.addEventListener('load', calcPrice)
}