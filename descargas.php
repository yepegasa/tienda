<?php
include 'global/config.php';
include 'global/conexion.php';
include 'carrito.php';

?>
<?php

if ($_POST) {
    $IDVENTA = openssl_decrypt($_POST['IDVENTA'], COD, KEY);
    $IDPRODUCTO = openssl_decrypt($_POST['IDPRODUCTO'], COD, KEY);

    //print_r($IDVENTA);
    //print_r($IDPRODUCTO);

    $sentencia = $pdo->prepare("SELECT * FROM tbldetalleventa 
            WHERE IDVENTA=:IDVENTA 
            AND IDPRODUCTO=:IDPRODUCTO
            AND descargado<". DESCARGASPERMITIDAS);

    $sentencia->bindParam(":IDVENTA", $IDVENTA);
    $sentencia->bindParam(":IDPRODUCTO", $IDPRODUCTO);
    $sentencia->execute();

    $listaProductos = $sentencia->fetchAll(PDO::FETCH_ASSOC);

    //print_r($listaProductos);
    if ($sentencia->rowCount() > 0) {
        echo "Archivo en descarga...";

        $nombreArchivo="archivos/".$listaProductos[0]['IDPRODUCTO'].".pdf";

        $NuevoNombreArchivo= $_POST['IDVENTA']. $_POST['IDPRODUCTO'].".pdf";

        echo $NuevoNombreArchivo;

        header("Content-Transfer-Encoding: binary");
        header("Content-type: aplication/force-download");
        header("Content-Disposition: attachment; filename=$NuevoNombreArchivo");
        readfile("$nombreArchivo");

        $sentencia = $pdo->prepare("UPDATE `tbldetalleventa` 
SET `descargado` = descargado+1
WHERE IDVENTA = :IDVENTA AND IDPRODUCTO=:IDPRODUCTO;");

        $sentencia->bindParam(":IDVENTA", $IDVENTA);
        $sentencia->bindParam(":IDPRODUCTO", $IDPRODUCTO);
        $sentencia->execute();
    } else {
        include 'template/cabecera.php';
        echo "<br><br><br><br><h2>Tus descargas se agotaron</h2>";
        include 'template/pie.php';
    }
}

?>