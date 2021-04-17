<?php

$router->get('/menu', ['middleware' => 'auth', 'uses' => 'MenuController@read']);
$router->options('/menu', function() { return "OPTIONS"; });

$router->post('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@create']);
$router->get('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@read']);
$router->get('/usuario/login[/{timestamp}]', ['uses' => 'UsuarioController@login']);
$router->patch('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@update']);
$router->delete('/usuario', ['middleware' => 'auth', 'uses' => 'UsuarioController@delete']);
$router->patch('/usuario/clave', ['middleware' => 'auth', 'uses' => 'UsuarioController@clave']);
$router->options('/usuario[/{timestamp}]', function() { return "OPTIONS"; });

$router->get('/permiso', ['middleware' => 'auth', 'uses' => 'PermisoController@read']);
$router->options('/permiso', function() { return "OPTIONS"; });

$router->post('/chofer', ['middleware' => 'auth', 'uses' => 'ChoferController@create']);
$router->get('/chofer', ['middleware' => 'auth', 'uses' => 'ChoferController@read']);
$router->patch('/chofer', ['middleware' => 'auth', 'uses' => 'ChoferController@update']);
$router->delete('/chofer', ['middleware' => 'auth', 'uses' => 'ChoferController@delete']);
$router->options('/chofer', function() { return "OPTIONS"; });

$router->post('/vehiculo', ['middleware' => 'auth', 'uses' => 'VehiculoController@create']);
$router->get('/vehiculo', ['middleware' => 'auth', 'uses' => 'VehiculoController@read']);
$router->patch('/vehiculo', ['middleware' => 'auth', 'uses' => 'VehiculoController@update']);
$router->delete('/vehiculo', ['middleware' => 'auth', 'uses' => 'VehiculoController@delete']);
$router->options('/vehiculo', function() { return "OPTIONS"; });

$router->get('/vehiculotipo', ['middleware' => 'auth', 'uses' => 'VehiculoTipoController@read']);
$router->options('/vehiculotipo', function() { return "OPTIONS"; });

$router->get('/reporte/garantiafecha', ['middleware' => 'auth', 'uses' => 'ReporteController@garantiaFecha']);
$router->options('/reporte[/{reporte}]', function() { return "OPTIONS"; });
