(() => {
  'use strict'

  const forms = document.querySelectorAll('.needs-validation')

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

  let nombre = document.getElementById ("exampleFormControlNombre")
  let email = document.getElementById("exampleFormControlInput1")
  let mensaje = document.getElementById("exampleFormControlMensaje")
  let form = document.getElementById ("form")
  
  
  form.addEventListener("submit", e=>{
    e.preventDefault ()
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;

        if (nombre.value == "")
        {
        alert ("Ingrese Nombre")
        return false
        }

        if (!emailRegex.test(email.value))
        {
        alert ("Ingrese Email")
        return false
        }

        if (mensaje.value =="")
        {
          alert ("Ingrese Mensaje")
          return false
        }
      })