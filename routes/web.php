<?php

$router->get('/menu', ['uses' => 'MenuController@read']);
$router->get('/usuario', ['uses' => 'UsuarioController@read']);