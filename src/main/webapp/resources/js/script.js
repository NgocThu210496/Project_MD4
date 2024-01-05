function changeSortBy(){
    let sortBy = document.getElementById("sortBy").value;
    //Gọi controller
    window.location="findAll?sortBy="+sortBy;
}
function changeDirection(){
    let direction = document.getElementById("direction").value;
    window.location="findAll?direction="+direction;
}