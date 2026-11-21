# Pruebas de aceptación

| Caso | Acción | Resultado esperado |
|---|---|---|
| Login válido | Usar correo y contraseña demo | Se abre el inventario |
| Login inválido | Usar una clave incorrecta | Se muestra un error |
| Código duplicado | Crear un producto con código existente | Se rechaza el registro |
| Valor negativo | Ingresar precio o stock menor que cero | El formulario no permite guardar |
| Entrada | Registrar entrada de 5 unidades | El stock aumenta en 5 |
| Salida válida | Registrar salida menor o igual al stock | El stock disminuye |
| Salida inválida | Registrar salida mayor al stock | Se rechaza y no cambia el stock |
| Stock bajo | Dejar stock actual menor al mínimo | Se muestra el estado en rojo |
| Desactivación | Desactivar un producto | Desaparece de los activos, pero conserva historial |
| Búsqueda | Buscar por código, nombre o categoría | Se filtran los resultados |
