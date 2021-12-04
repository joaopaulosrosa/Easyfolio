// TODO: Autocomplete the input with AJAX calls.
const autocomplete = (e) => {
  const results = document.querySelector('#results');
  const input = document.querySelector('#find-coin');
  console.log(results);
  console.log(input);
  fetch(`https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd`)
    .then(response => response.json())
    .then((data) => {
      results.innerHTML = '';
      data.forEach((coin) => {
        if (coin.symbol.match(".*" + e.target.value + ".*")) {
          results.insertAdjacentHTML('beforeend', `<li>${coin.symbol}</li>`);
        }
        else {
          // console.log(data);
        }
      });

      const items = results.getElementsByTagName('li');
      console.log(items.innerText);
      const allResultItems = document.querySelectorAll('#results li');
      // Itera sobre o array de elementos HTML
      allResultItems.forEach((item) => {
        // Aqui você vai ver que ele vai printar cada um dos elementos li do HTML
        console.log(item);
        // Vamos colocar um addEventListener para cada um desses elementos
        // Obs: esse trecho de código tá dentro de um then de uma requisição
        // Ou seja, se essa função for chamada n vezes, a gente vai tar stackando o listener n vezes
        // Então toma cuidado pra ver se é isso mesmo que precisa ser feito
        item.addEventListener("click", (event) => {
          // Pega o conteúdo do item e coloca como value no input
          input.value = item.innerText;
        });
      });
    });
};


export { autocomplete };
