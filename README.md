# TecnoStock

MVP de sistema de inventario para el Caso 1. Está desarrollado con PHP 8, PDO, MySQL, HTML, CSS y JavaScript básico, sin frameworks complejos.

## Instalación en XAMPP

1. Copia la carpeta `PORYECTO, sistema` dentro de `C:\xampp\htdocs\`.
2. Abre XAMPP e inicia Apache y MySQL.
3. Entra a `http://localhost/phpmyadmin`.
4. Importa el archivo `database.sql`.
5. Abre `http://localhost/PORYECTO,%20sistema/app/login.php`.

Usuario de prueba: `admin@tecnstock.cl`  
Contraseña: `password`

Si tu MySQL tiene contraseña, modifica `DB_PASS` en `app/config.php`.

## Funcionalidades

- Inicio de sesión con sesión PHP.
- CRUD de productos y desactivación lógica.
- Búsqueda por código, nombre o categoría.
- Entradas y salidas con transacción y bloqueo de fila.
- Validación de stock no negativo y alerta de stock bajo.
- Consultas preparadas mediante PDO y token CSRF.

## Video

Demostrar login, registro/edición, búsqueda, movimiento de entrada, movimiento de salida, alerta de stock bajo y recorrer `database.sql`, `config.php`, `product_save.php` y `movement_save.php`.
