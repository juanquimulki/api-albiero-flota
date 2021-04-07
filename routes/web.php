<?php

$router->get('/menu', ['middleware' => 'auth', 'uses' => 'MenuController@read']);
$router->options('/menu', function() { return "OPTIONS"; });

$router->post('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@create']);
$router->get('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@read']);
$router->get('/usuario/login[/{timestamp}]', ['uses' => 'UsuarioController@login']);
$router->patch('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@update']);
$router->delete('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@delete']);
$router->options('/usuario[/{timestamp}]', function() { return "OPTIONS"; });

$router->get('/permiso', ['middleware' => 'auth', 'uses' => 'PermisoController@read']);
$router->options('/permiso', function() { return "OPTIONS"; });

$router->get('/chofer', ['middleware' => 'auth', 'uses' => 'ChoferController@read']);
$router->options('/chofer', function() { return "OPTIONS"; });
