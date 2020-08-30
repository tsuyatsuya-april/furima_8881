const pay = () => {
  console.log("function is OK")
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);　// PAY.JPテスト公開鍵
  console.log("payjp OK");
  const form = document.getElementById('charge-form');
  form.addEventListener("submit", (e) => {
    e.preventDefault();
  console.log("form is OK");
    const formResult = document.getElementById('charge-form');
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[cvc]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
    };
    console.log(card);
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      if (status === 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='purchase_address[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      } else {
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value="" type="hidden" name='purchase_address[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // $(".buy-red-btn").prop('disabled', false);
        //   alert("カード情報を正しく入力してください");
      }
        
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
    });
  });
};

window.addEventListener("load", pay);