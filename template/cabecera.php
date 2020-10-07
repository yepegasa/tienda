<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Title</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <!--tips: to change the nav placement use .fixed-top,.fixed-bottom,.sticky-top-->
        <a class="navbar-brand" href="index.php">Logo de la empresa</a></a>
        <!--<a class="navbar-brand" href="#">
        <img src="..." class="d-inline-block align-top" width="30" height="30" alt="...">My Brand
    </a>-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <div class="row col-lg-6">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="mostrarCarrito.php">Carrito(<?php
                                                                                echo (empty($_SESSION['CARRITO'])) ? 0 : count($_SESSION['CARRITO']);
                                                                                ?>)</a>
                    </li>
                </ul>
            </div>
            <div class="row col-lg-6">
                <span class="navbar-text">
                    ¿Qué buscas?
                </span>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2 col-md-8" type="search" placeholder="Buscar" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>



        </div>
    </nav>
    <div class="container">