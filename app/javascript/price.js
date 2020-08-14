$(document).on('turbolinks:load',  function() {
  // 再度読み込んだ際の処理
  const regex = /^[0-9]{3,7}$/;
  let $input = $('#item-price');
  const first = $('#item-price').val();
  if (regex.test(first)){
    $('#add-tax-price').text(Math.floor(first / 10).toLocaleString());
    $('#profit').text(Math.floor(first * 9 / 10).toLocaleString());
  }
  // 入力値が変化する度に行われる処理
  $input.on('input', function(event){
    let price = $('#item-price').val();
    let fee = "";
    let profit = "";
    if (regex.test(price)){
      // 小数点以下切り捨て
      fee = Math.floor(price / 10);
      profit = Math.floor(price - fee);
    }
    $('#add-tax-price').text(fee.toLocaleString());
    $('#profit').text(profit.toLocaleString());
  });
  
});
