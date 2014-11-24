document.addEventListener('dragstart', function(e) { 
  console.log('Drag Interaction Started!');
  e.dataTransfer.effectAllowed = 'move';
  e.dataTransfer.setData('text', this.innerHTML);
  elementDragged = this;
}
);
var dropZoneOne = document.querySelector('#drop-target-one');
var dragElement = document.querySelectorAll('#ec1');
var elementDragged = null;

document.addEventListener('dragend', function(e) {
    console.log("Ended");
    elementDragged = null;
  });