# Guion para el video de 5 minutos

## 0:00 a 0:30 — Problema y solución

“TecnoStock necesitaba reemplazar una planilla que provocaba códigos duplicados y errores de stock. La solución es una aplicación web en PHP conectada a MySQL, que permite gestionar productos y movimientos de inventario.”

## 0:30 a 2:30 — Demostración del producto

1. Iniciar sesión con `admin@tecnstock.cl` y `password`.
2. Mostrar el listado y la alerta del producto con stock bajo.
3. Buscar por nombre o código.
4. Crear o editar un producto.
5. Registrar una entrada y mostrar el stock actualizado.
6. Registrar una salida válida.
7. Intentar una salida mayor al stock para demostrar la validación.
8. Desactivar un producto y explicar que no se elimina físicamente.

## 2:30 a 4:30 — Código y base de datos

Mostrar brevemente:

- `database.sql`: tablas, claves primarias, claves foráneas y código único.
- `config.php`: conexión PDO y consultas preparadas.
- `product_save.php`: validaciones y registro/edición.
- `movement_save.php`: transacción, bloqueo del producto y actualización automática.
- `style.css`: interfaz responsiva y estados visuales.

## 4:30 a 5:00 — Cierre

“El sistema cumple el flujo solicitado: login, productos, búsqueda, edición, desactivación, movimientos y alerta de stock bajo. El código y el script SQL están disponibles en el repositorio de GitHub.”
