
//WELCOME 

var user = ['Admin','Faculty','Student'];

var currentUser = 2;

//Display the User accodingly
document.querySelector('.current').textContent = user[currentUser];

//First letter in red color
document.querySelector('.color-chnge').style.color = "red";


//All data to be hide
document.querySelector(".admin").style.display = 'none';
document.querySelector(".faculty").style.display = 'none';
document.querySelector(".student").style.display = 'none';

if(currentUser === 0){
    document.querySelector(".admin").style.display = 'block';
}
else if(currentUser === 1){
    document.querySelector(".faculty").style.display = 'block';
}
else if(currentUser === 2){
    document.querySelector(".student").style.display = 'block';
}
