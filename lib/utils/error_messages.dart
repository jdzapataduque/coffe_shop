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

  String getMessage(String _codmsg) {
    // Se crea en un método a parte el de obtener los
    // textos o mensajes de los widgets , en caso de que se tenga
    //que realizar una lógica diferente para los errores
    String _msg = '';
    switch (_codmsg) {
      case 'MSG0001':
        _msg = 'Ingrese el correo electrónico...';
        break;
      case 'MSG0002':
        _msg = 'Correo electrónico';
        break;
      case 'MSG0003':
        _msg = 'Ingrese la contraseña...';
        break;
      case 'MSG0004':
        _msg = 'Contraseña';
        break;
      case 'MSG0005':
        _msg = 'INGRESAR';
        break;
      case 'MSG0006':
        _msg = '¿No tienes una cuenta aún?';
        break;
      case 'MSG0007':
        _msg = 'CREAR CUENTA';
        break;
      case 'MSG0008':
        _msg = 'He olvidado mi contraseña';
        break;
      case 'MSG0009':
        _msg = 'Tipo de consumidor';
        break;
      case 'MSG0010':
        _msg = 'Nombre';
        break;
      default:
        _msg = 'Mensaje no definido para $_msg';
    }
    return _msg;
  }
}
