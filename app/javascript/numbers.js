$(function() {
  let $input = $('#item-price');
  $input.on('input', function(event){
    let price = $('#item-price').val();
    const regex = /^[0-9]{3,7}$/;
    let fee = "";
    let profit = "";
    if (regex.test(price)){
      fee = Math.floor(price / 10);
      profit = Math.floor(price - fee);
    }
    $('#add-tax-price').text(fee);
    $('#profit').text(profit);
  });
  
});


