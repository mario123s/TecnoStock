<?php
declare(strict_types=1);

const DB_HOST = '127.0.0.1';
const DB_NAME = 'tecnstock';
const DB_USER = 'root';
const DB_PASS = '';

session_start();

function db(): PDO {
    static $pdo = null;
    if ($pdo === null) {
        $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8mb4', DB_USER, DB_PASS, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]);
    }
    return $pdo;
}

function e(?string $value): string { return htmlspecialchars($value ?? '', ENT_QUOTES, 'UTF-8'); }
function redirect(string $url): void { header('Location: '.$url); exit; }
function flash(string $type, string $message): void { $_SESSION['flash'] = [$type, $message]; }
function get_flash(): ?array { $f = $_SESSION['flash'] ?? null; unset($_SESSION['flash']); return $f; }
function csrf_token(): string { return $_SESSION['csrf'] ??= bin2hex(random_bytes(16)); }
function verify_csrf(): void {
    if (!hash_equals($_SESSION['csrf'] ?? '', $_POST['csrf'] ?? '')) { http_response_code(419); exit('Solicitud no válida.'); }
}
function require_login(): void { if (empty($_SESSION['user'])) redirect('login.php'); }
