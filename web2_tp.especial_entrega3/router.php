<?php
    require_once 'config.php';
    require_once 'libs/router.php';

    require_once 'app/controllers/buys.api.controller.php';

    $router = new Router();

    #                 endpoint        verbo       controller         método
    $router->addRoute('clientes',     'GET',    'buysController',   'get'   );
    $router->addRoute('clientes',     'POST',   'buysController',   'create');
    $router->addRoute('clientes/:ID', 'GET',    'buysController',   'description');
    $router->addRoute('clientes/:ID', 'PUT',    'buysController',   'update');
    $router->addRoute('clientes/:ID', 'DELETE', 'buysController',   'delete');
    
    $router->addRoute('clientes/:ID/:subrecurso', 'GET',    'buysController', 'get'   );
    //'/clientes/{cliente_id}/compras'
    
    $router->route($_GET['resource'], $_SERVER['REQUEST_METHOD']);