function Tax_price() {
  const priceInsert = document.getElementById("item-price")
  priceInsert.addEventListener("input", function(){
    const insertValue = priceInsert.value
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = Math.floor(insertValue * 0.1)
    const salesProfit = document.getElementById("profit")
    salesProfit.innerHTML = insertValue - addTaxPrice.innerHTML
  })
}

window.addEventListener('load', Tax_price)