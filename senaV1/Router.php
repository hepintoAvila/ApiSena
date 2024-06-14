<?php
class Router {
    private $routes = [];

    public function addRoute($method, $path, $handler) {
        $this->routes[] = [
            'method' => $method,
            'path' => $path,
            'handler' => $handler
        ];
    }

    public function handleRequest() {
        $method = $_SERVER['REQUEST_METHOD'];
        $path = isset($_GET['accion']) ? base64_decode($_GET['accion']) : '';

        foreach ($this->routes as $route) {
            if ($route['method'] === $method && $route['path'] === $path) {
                call_user_func($route['handler']);
                return;
            }
        }

        // If no route matched, return 404
        header("HTTP/1.0 404 Not Found");
        echo "Acción no reconocida: '".$path."'".$path."'";
       // print_r($this->routes);
    }
}
?>
