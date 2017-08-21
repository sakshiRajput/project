/**
 * <button onclick="myFunction()">Show Snackbar</button>

    <div id="snackbar">Some text some message..</div>
 */

function myFunction() {
    var x = document.getElementById("snackbar")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
