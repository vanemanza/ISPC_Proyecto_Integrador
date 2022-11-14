
// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
    'use strict'
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')
  
    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
  
        form.classList.add('was-validated')
      }, false)
    })
  })()


 

    let nombre = document.getElementById ("nombre")
    let dni = document.getElementById("dni")
    let email = document.getElementById("email")
    let contraseña = document.getElementById("password")
    let contraseña1 = document.getElementById("password1")
    let form = document.getElementById ("form")
   

    form.addEventListener("submit", e=>{
    e.preventDefault ()
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;

        if (nombre.value == "")
        {
        alert ("complete los campos")
        return false
        }

        if (dni.value.length < 8 || dni.value.length >8 )
        {
        alert ("Dni no valido")
        return false
        }

        if (!emailRegex.test(email.value))
        {
        alert ("correo no valido")
        return false
        }

        if (contraseña.value.length < 8){
        alert ("contraseña insegura")
        return false
        }
  
        if (contraseña1.value != contraseña.value || contraseña1.value.length < 8)
        {
        alert ("las contraseñas ingresadas no coinciden")
        return false
        }
    })