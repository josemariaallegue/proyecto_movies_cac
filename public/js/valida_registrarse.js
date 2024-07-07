document.addEventListener('DOMContentLoaded', () => {
    const registerForm = document.getElementById('registerForm');
    registerForm.addEventListener('submit', async (event) => {
      if (!validateForm()) {
          console.log('El formulario no es válido. Por favor, corrige los errores.');
          event.preventDefault();
      } else {
          console.log('El formulario es válido. Enviar datos...');
          event.preventDefault();
          const formData = new FormData(registerForm);
            try {
                const response = await fetch('/auth/register', {
                    method: 'POST',
                    body: formData
                });

                if (response.ok) {
                    console.log('Registro exitoso!!');
                    window.location.href = './iniciosesion.html';
                } else {
                    console.error('Error de registro:', result.error);
                }
            } catch (error) {
                console.error('Error en la solicitud:', error);
            }
        }
    });


  const validateForm = () => {
      let isValid = true;

      isValid = validateField('Name', 'El nombre es obligatorio') && isValid;
      isValid = validateField('Surname', 'El apellido es obligatorio') && isValid;
      isValid = validateEmailField('Email', 'El correo electrónico no es válido') && isValid;
      isValid = validateField('Password', 'La contraseña es obligatoria') && isValid;
      isValid = validateField('Birthday', 'La fecha de nacimiento es obligatoria') && isValid;
      /*isValid = validateField('ProfilePicture', 'La imagen de perfil es obligatoria') && isValid;*/
      isValid = validateField('Countries_CountryID', 'El país es obligatorio') && isValid;

      const terminos = document.getElementById('terminos').checked;
      if (!terminos) {
          isValid = false;
          setErrorFor(document.getElementById('terminos'), 'Debes aceptar los términos y condiciones');
      } else {
          setSuccessFor(document.getElementById('terminos'));
      }

      return isValid;
  };

  const validateField = (fieldId, errorMessage) => {
      const field = document.getElementById(fieldId);
      const value = field.value.trim();
      if (value === '') {
          setErrorFor(field, errorMessage);
          return false;
      } else {
          setSuccessFor(field);
          return true;
      }
  };

  const validateEmailField = (fieldId, errorMessage) => {
      const field = document.getElementById(fieldId);
      const email = field.value.trim();
      if (email === '') {
          setErrorFor(field, 'El correo electrónico es obligatorio');
          return false;
      } else if (!isEmail(email)) {
          setErrorFor(field, errorMessage);
          return false;
      } else {
          setSuccessFor(field);
          return true;
      }
  };

  const setErrorFor = (input, message) => {
      const formControl = input.closest('div');
      const errorText = formControl.querySelector('.error-text');
      formControl.classList.add('error');
      errorText.innerText = message;
      input.focus();
  };

  const setSuccessFor = (input) => {
      const formControl = input.closest('div');
      formControl.classList.remove('error');
      const errorText = formControl.querySelector('.error-text');
      errorText.innerText = '';
  };

  const isEmail = (email) => {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return re.test(email);
  };

  registerForm.querySelectorAll('input').forEach(input => {
    input.addEventListener('input', () => {
        const value = input.value.trim();
        if (value !== '') {
            setSuccessFor(input);
        }
    });
});

registerForm.querySelectorAll('select').forEach(select => {
    select.addEventListener('change', () => {
        const value = select.value;
        if (value !== '') {
            setSuccessFor(select);
        }
    });
});
});