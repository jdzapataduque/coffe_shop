class ErrorMessages {
  String getError(String _coderror) {
    String _msg_error = '';
    switch (_coderror) {
      case 'TCF0001':
        _msg_error = 'Debes ingresar un correo electrónico';
        break;
      case 'TCF0002':
        _msg_error = 'Ingresa un correo electrónico válido';
        break;
      case 'TCF0003':
        _msg_error = 'Debes ingresar tu contraseña';
        break;
      case 'TCF0004':
        _msg_error = 'Debes ingresar tu nombre';
        break;
      case 'TCF0005':
        _msg_error = 'Debes ingresar tu apellido';
        break;
      case 'TCF0006':
        _msg_error = 'Email o contraseña no válidos';
        break;
      case 'TCF0007':
        _msg_error = 'Debes seleccionar la fecha de nacimiento';
        break;
      case 'TCF0008':
        _msg_error = 'Debes seleccionar el género';
        break;
      case 'TCF0009':
        _msg_error = 'Debes presionar el botón de atrás para regresar'
            'a la página principal de la app';
        break;
      default:
        _msg_error = 'Mensaje no definido para $_coderror';
    }
    return _msg_error;
  }
}
