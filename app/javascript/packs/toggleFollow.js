function toggleFollow(){
  console.log("Entro");
  var t = document.getElementById("flexSwitchCheckDefault");
  if (t.checked == true){
    alert("Following");
    
  } else {
    alert("Unfollow");
  }
}