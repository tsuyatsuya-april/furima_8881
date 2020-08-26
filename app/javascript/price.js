function price() {
  const regex = /^[0-9]{3,7}$/;
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input", value);
  function value(e){
    if (regex.test(price.value)){
      tax.textContent = Math.floor((e.target.value)*0.1).toLocaleString();
      profit.textContent = Math.floor((e.target.value)*0.9).toLocaleString();
    };
  };
};

window.addEventListener("load", price);