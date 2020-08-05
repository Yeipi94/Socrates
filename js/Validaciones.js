

function FormataDataHora(Obj)
{
    if (Obj.value.length == 2 || Obj.value.length == 5) {
        Obj.value = Obj.value + "-"
    }
    if (Obj.value.length == 10) {
        Obj.value = Obj.value + " "
    }
    if (Obj.value.length == 13 || Obj.value.length == 16) {
        Obj.value = Obj.value + ":"
    }

}


function numbersonly(e)
{
    var unicode = e.charCode ? e.charCode : e.keyCode
    if (unicode != 8 && unicode != 44) {
            if (unicode < 48 || unicode > 57) //if not a number
            { return false } //disable key press    
        }
}  

function SoloNumeros(evt)
{
    if (window.event) {//asignamos el valor de la tecla a keynum
        keynum = evt.keyCode; //IE
    }
    else {
        keynum = evt.which; //FF
    }
    //comprobamos si se encuentra en el rango numérico y que teclas no recibirá.
    if ((keynum > 47 && keynum < 58) || keynum == 8 || keynum == 13 || keynum == 6) {
        return true;
    }
    else {
        return false;
    }
}//funcion no valida

function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toString();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyzÁÉÍÓÚABCDEFGHIJKLMNÑOPQRSTUVWXYZ";//Se define todo el abecedario que se quiere que se muestre.
    especiales = [8, 37, 39, 46, 6]; //Es la validación del KeyCodes, que teclas recibe el campo de texto.

    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        alert('Tecla no aceptada');
        return false;
    }


}





    


