window.addEventListener('load', () => {    //読み込むHTMLの大枠を読み込むたびに取得している
  const priceInput = document.getElementById("item-price");    //関数priceInputをHTMLの場所のidを使って取得している
  priceInput.addEventListener('input', () => {    //フォームに入力されるたびにイベント発火する様にしている
    const inputValue = priceInput.value;    //value属性を指定し、input要素から実際に入力した金額の値を取得している
    
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));    //innerHTMLで、計算後の数値を表示している。Math.floor(inputValue * 0.1)で、入力された数値の10%を計算している

    const profitNumber = document.getElementById("profit")
      const value_result = inputValue * 0.1    //ここでもう一度、入力された値に * 0.1 して関数を定義して、この後の計算に使用している。上の部分は上の部分で完結しているので、再利用はできないと考える。
      profitNumber.innerHTML = (Math.floor(inputValue - value_result));    //入力された値から、手数料を引いた分を計算している
  })
});

