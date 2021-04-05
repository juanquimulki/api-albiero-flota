<?php

$router->get('/menu', ['uses' => 'MenuController@read']);

$router->post('/usuario', ['uses' => 'UsuarioController@create']);
$router->get('/usuario', ['uses' => 'UsuarioController@read']);
$router->get('/usuario/login[/{timestamp}]', ['uses' => 'UsuarioController@login']);
$router->patch('/usuario', ['uses' => 'UsuarioController@update']);
$router->delete('/usuario', ['uses' => 'UsuarioController@delete']);
$router->options('/usuario[/{timestamp}]', function() { return "OPTIONS"; });

$router->get('/permiso', ['uses' => 'PermisoController@read']);
