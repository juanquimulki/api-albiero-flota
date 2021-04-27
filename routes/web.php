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

$router->get('/combustibletipo', ['middleware' => 'auth', 'uses' => 'CombustibleTipoController@read']);
$router->options('/combustibletipo', function() { return "OPTIONS"; });

$router->get('/reporte/garantiafecha', ['middleware' => 'auth', 'uses' => 'ReporteController@garantiaFecha']);
$router->options('/reporte[/{reporte}]', function() { return "OPTIONS"; });

$router->post('/kilometraje', ['middleware' => 'auth', 'uses' => 'KilometrajeController@create']);
$router->get('/kilometraje', ['middleware' => 'auth', 'uses' => 'KilometrajeController@read']);
$router->patch('/kilometraje', ['middleware' => 'auth', 'uses' => 'KilometrajeController@update']);
$router->delete('/kilometraje', ['middleware' => 'auth', 'uses' => 'KilometrajeController@delete']);
$router->options('/kilometraje', function() { return "OPTIONS"; });

$router->post('/parte', ['middleware' => 'auth', 'uses' => 'ParteController@create']);
$router->get('/parte', ['middleware' => 'auth', 'uses' => 'ParteController@read']);
$router->patch('/parte', ['middleware' => 'auth', 'uses' => 'ParteController@update']);
$router->delete('/parte', ['middleware' => 'auth', 'uses' => 'ParteController@delete']);
$router->options('/parte', function() { return "OPTIONS"; });

$router->post('/tarea', ['middleware' => 'auth', 'uses' => 'TareaController@create']);
$router->get('/tarea', ['middleware' => 'auth', 'uses' => 'TareaController@read']);
$router->patch('/tarea', ['middleware' => 'auth', 'uses' => 'TareaController@update']);
$router->delete('/tarea', ['middleware' => 'auth', 'uses' => 'TareaController@delete']);
$router->options('/tarea', function() { return "OPTIONS"; });

$router->post('/log', ['uses' => 'LogController@create']);
$router->patch('/log', ['uses' => 'LogController@update']);
$router->options('/log', function() { return "OPTIONS"; });
