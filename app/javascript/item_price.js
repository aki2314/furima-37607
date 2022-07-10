window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
  const addTaxDome = document.getElementById("profit");
  addTaxDome.innerHTML = Math.floor(priceInput.value - priceInput.value * 0.1);
})
});