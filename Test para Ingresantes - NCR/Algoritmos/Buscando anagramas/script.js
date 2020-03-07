$(document).ready(function(){
    $("#submit").click(function (e) { 
        e.preventDefault();
        var anagrama = $("#anagrama").val();
        var subcadena = $("#subcadena").val();
        var message;
        var isClass;
        var total = solution(anagrama,subcadena);
        if (anagrama != '' && subcadena != '') {
            message=`La subcadena "${subcadena}" aparece ${total} veces en el texto`
            isClass = 'alert alert-success'
        } else {
            message=`Ninguno de los campos pueden estar vacios`
            isClass = 'alert alert-danger'
        }
        $("#result").empty()
        var alert = $("<div>",{
            'class': isClass,
            'role': 'alert'
        }).append($("<h4>",{
            'class': 'alert-heading'
        }).text(message));
        $("#result").append(alert);
        
    });
})

function solution(A,B) {
    A= A.toLowerCase().split("")
    B= B.toLowerCase().split("")
    var length = B.length;
    var max = A.length - length + 1;
    var counter = 0;
    for (let i = 0; i < max; i++) {
        if (check(B,A.slice(i,(i+length)))){
            counter++
        }
    }
    return counter;
}

function check(oldString, newString ) {
    var A= oldString.sort().join("");
    var B= newString.sort().join("");
    console.log(A)
    console.log(B)
    if (A==B) {
        return true;
    }else{
        return false;
    }
}