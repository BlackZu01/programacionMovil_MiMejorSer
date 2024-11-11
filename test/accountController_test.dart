import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/ui/Controller/accountController.dart';

void main() {
  group('Accountcontroller', () {
    late Accountcontroller accountController;

    setUp(() {
      accountController = Accountcontroller();
    });

    test('Valores iniciales correctos', () {
      expect(accountController.emailValue, '');
      expect(accountController.passwordValue, '');
      expect(accountController.nameValue, '');
      expect(accountController.emailGetList, []);
      expect(accountController.passwordGetList, []);
      expect(accountController.nameGetList, []);
      expect(accountController.getPts, 0);
    });

    test('Correo y contraseña', () {
      accountController.emailpassword('juseje@gmail.com', 'password123');
      expect(accountController.emailValue, 'juseje@gmail.com');
      expect(accountController.passwordValue, 'password123');
    });

    test('Actualizar nombre', () {
      accountController.changename('New Name');
      expect(accountController.nameValue, 'New Name');
    });

    test('Reset al nombre, contraseña, puntos', () {
      accountController.emailpassword('juseje@gmail.com', 'password123');
      accountController.changename('Name');
      accountController.addpts(10);
      accountController.reset();
      expect(accountController.emailValue, '');
      expect(accountController.passwordValue, '');
      expect(accountController.nameValue, '');
      expect(accountController.getPts, 0);
    });

    test('Añadir correos a la lista de correos', () {
      accountController.addEmailList('juseje@gmail.com');
      expect(accountController.emailGetList, ['juseje@gmail.com']);
    });

    test('Añadir nombres a la lista de nombres', () {
      accountController.addnameList('JuSeJe');
      expect(accountController.nameGetList, ['JuSeJe']);
    });

    test('Añadir contraseñas a la lista de contraseñas', () {
      accountController.addPasswordList('password123');
      expect(accountController.passwordGetList, ['password123']);
    });

    test('Confirmar la contraseña', () {
      accountController.addPasswordList('password123');
      expect(accountController.confirmPassword(0), 'password123');
    });

    test('Obtener el nombre por el indice', () {
      accountController.addnameList('JuSeJe');
      expect(accountController.obtainName(0), 'JuSeJe');
    });

    test('Añadir nombre', () {
      accountController.addnameList('JuSeJe');
      accountController.setname(0);
      expect(accountController.nameValue, 'JuSeJe');
    });

    test('Verificar el añadir puntos de progreso', () {
      accountController.addpts(10);
      expect(accountController.getPts, 10);
      accountController.addpts(5);
      expect(accountController.getPts, 15);
    });

    test('Colocar puntos', () {
      accountController.setpts(20);
      expect(accountController.getPts, 20);
    });
  });
}
