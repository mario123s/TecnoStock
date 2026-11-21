<?php
require_once __DIR__.'/config.php';
if (!empty($_SESSION['user'])) redirect('index.php');
$error = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();
    $correo = trim($_POST['correo'] ?? '');
    $clave = $_POST['clave'] ?? '';
    $stmt = db()->prepare('SELECT * FROM usuarios WHERE correo = ? AND estado = 1 LIMIT 1');
    $stmt->execute([$correo]);
    $user = $stmt->fetch();
    $valid = $user && (password_verify($clave, $user['clave']) || hash_equals($user['clave'], 'DEMO:'.$clave));
    if ($valid) {
        if (str_starts_with($user['clave'], 'DEMO:')) {
            $upgrade = db()->prepare('UPDATE usuarios SET clave = ? WHERE id_usuario = ?');
            $upgrade->execute([password_hash($clave, PASSWORD_DEFAULT), $user['id_usuario']]);
        }
        $_SESSION['user'] = ['id' => $user['id_usuario'], 'nombre' => $user['nombre'], 'correo' => $user['correo']];
        redirect('index.php');
    }
    $error = 'Correo o contraseña incorrectos.';
}
?><!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Ingreso | TecnoStock</title><link rel="stylesheet" href="../assets/style.css"></head><body class="login-page"><main class="login-card"><div class="brand-mark">TS</div><h1>TecnoStock</h1><p class="muted">Sistema de inventario</p><?php if ($error): ?><div class="alert danger"><?=e($error)?></div><?php endif; ?><form method="post"><input type="hidden" name="csrf" value="<?=e(csrf_token())?>"><label>Correo<input type="email" name="correo" required placeholder="admin@tecnstock.cl"></label><label>Contraseña<input type="password" name="clave" required placeholder="••••••••"></label><button class="btn primary full" type="submit">Iniciar sesión</button></form><p class="hint">Demo: admin@tecnstock.cl / password</p></main></body></html>
