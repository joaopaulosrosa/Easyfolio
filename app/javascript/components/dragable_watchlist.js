import tableDragger from 'table-dragger'

const dragableWatchlist = () => {

  var el = document.getElementById('table');
  var dragger = tableDragger(el, {
    mode: 'row',
    dragHandler: '.handle',
    onlyBody: true,
    animation: 300
  });
  dragger.on('drop', function (from, to) {
    console.log(from);
    console.log(to);
  });

};

export { dragableWatchlist }
