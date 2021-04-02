<?php

$router->get('/menu', ['uses' => 'MenuController@read']);
$router->get('/usuario', ['uses' => 'UsuarioController@read']);
$router->post('/usuario', ['uses' => 'UsuarioController@create']);
$router->patch('/usuario', ['uses' => 'UsuarioController@update']);
$router->options('/usuario', function() { return "OPTIONS"; });