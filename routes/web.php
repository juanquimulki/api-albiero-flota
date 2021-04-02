<?php

$router->get('/menu', ['uses' => 'MenuController@read']);
$router->post('/usuario', ['uses' => 'UsuarioController@create']);
$router->get('/usuario', ['uses' => 'UsuarioController@read']);
$router->patch('/usuario', ['uses' => 'UsuarioController@update']);
$router->delete('/usuario', ['uses' => 'UsuarioController@delete']);
$router->options('/usuario', function() { return "OPTIONS"; });