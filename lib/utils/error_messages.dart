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
      case 'TCF0010':
        _msg_error = 'Error cargando suscripciones actuales';
        break;
      case 'TCF0011':
        _msg_error =
            'Hubo un error buscando tus suscripciones actuales, te ofrecemos disculpas';
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
      case 'MSG0011':
        _msg = 'Ingrese el nombre...';
        break;
      case 'MSG0012':
        _msg = 'Ingrese el apellido...';
        break;
      case 'MSG0013':
        _msg = 'Apellido';
        break;
      case 'MSG0014':
        _msg = 'Seleccione la fecha de nacimiento...';
        break;
      case 'MSG0015':
        _msg = 'Fecha de nacimiento';
        break;
      case 'MSG0016':
        _msg = 'Seleccione el género...';
        break;
      case 'MSG0017':
        _msg = 'Género';
        break;
      case 'MSG0018':
        _msg = '¿Ya tienes una cuenta?';
        break;
      case 'MSG0019':
        _msg = 'Cerrar sesión';
        break;
      case 'MSG0020':
        _msg = 'Iniciar sesión';
        break;
      case 'MSG0021':
        _msg = 'Libros';
        break;
      case 'MSG0022':
        _msg = 'Encuentra libros a buenos precios.';
        break;
      case 'MSG0023':
        _msg = 'Eventos';
        break;
      case 'MSG0024':
        _msg = '¿Eres un amante al café? acá encontraras todo lo necesario.';
        break;
      case 'MSG0025':
        _msg = 'Artículos';
        break;
      case 'MSG0026':
        _msg = 'Encuentra pines, mugs, velas y muchos regalitos más.';
        break;
      case 'MSG0027':
        _msg = 'Suscripciones actuales';
        break;
      case 'MSG0028':
        _msg = 'Encuentra tus suscripciones actuales';
        break;
      case 'MSG0029':
        _msg = 'Suscripciones disponibles';
        break;
      case 'MSG0030':
        _msg =
            'Mira las suscripciones disponibles que tenemos para ti , seguro te gustarán';
        break;
      case 'MSG0031':
        _msg = 'Ver más';
        break;
      case 'MSG0032':
        _msg = 'Por favor espere...';
        break;
      case 'MSG0033':
        _msg = 'Aceptar';
        break;
      case 'MSG0034':
        _msg = 'No tienes suscripciones actuales';
        break;
      case 'MSG0035':
        _msg = 'Error';
        break;
      case 'MSG0036':
        _msg = 'Por favor verifica tu conexión a internet';
        break;
      case 'MSG0037':
        _msg = 'MENÚ';
        break;
      case 'MSG0038':
        _msg = 'INICIO';
        break;
      case 'MSG0039':
        _msg = 'CAFÉS';
        break;
      case 'MSG0040':
        _msg = 'SUSCRIPCIONES';
        break;
      case 'MSG0041':
        _msg = 'MÉTODOS';
        break;
      case 'MSG0042':
        _msg = 'KITS & REGALOS';
        break;
      case 'MSG0043':
        _msg = 'DULCES';
        break;
      case 'MSG0044':
        _msg = 'OTROS';
        break;
      case 'MSG0045':
        _msg = 'PUNTOS';
        break;
      case 'MSG0046':
        _msg = 'Tiendas';
        break;
      case 'MSG0047':
        _msg = '#CoffeLovers';
        break;
      case 'MSG0048':
        _msg =
            'Estamos presentando algunos problemas en nuestro sistema, pronto lo resolveremos';
        break;
      case 'MSG0049':
        _msg = 'Error cargando suscripciones disponibles';
        break;
      case 'MSG0050':
        _msg =
            'Hubo un error buscando tus suscripciones disponibles, te ofrecemos disculpas';
        break;
      case 'MSG0051':
        _msg = 'No hay suscripciones disponibles';
        break;
      default:
        _msg = 'Mensaje no definido para $_msg';
    }
    return _msg;
  }
}
