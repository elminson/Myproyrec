<?php 
	
	session_start();
       if($_SESSION['rol'] != 1 and $_SESSION['rol'] !=2)
	{
		header("location: ./");
       }

	include "../conexion.php";

	if(!empty($_POST))
	{
	       $alert='';
		if(empty($_POST['nombre']) || empty($_POST['telefono']) || empty($_POST['direccion']))
		{
			$alert='<p class="msg_error">Todos los campos son obligatorios.</p>';
		}else{

			$idCliente = $_POST['id'];
			$nit  = $_POST['nit'];
			$nombre  = $_POST['nombre'];
			$telefono = md5($_POST['telefono']);
			$direccion  = $_POST['direccion'];

			$result = 0;

			if(is_numeric($nit) and $nit !=0)
			{
$query = mysqli_query($conection,"SELECT * FROM cliente
				  WHERE (nit = '$nit' AND idcliente != $idCliente)
									");
								 
		   										   
           $result = mysqli_fetch_array($query);
           $result = count($result);

           }


			if($result > 0){
				$alert='<p class="msg_error">El nit ya existe,Ingrese otro.</p>';
			}else{

			if($nit == '')
				{

				$nit = 0; 

				}	


$sql_update = mysqli_query($conection,"UPDATE cliente
       SET nit = $nit', nombre='$nombre',telefono='$telefono',direccion='$direccion'

                         WHERE idcliente= $idCliente ");
	
 
	

	if($sql_update){
	  $alert='<p class="msg_save">Usuario actualizado correctamente.</p>';
				}else{
		$alert='<p class="msg_error">Error al actualizar el cliente.</p>';
				}

			}


		}

		}

	

	//Mostrar Datos
	if(empty($_REQUEST['id']))
	{
		header('Location: lista_proveedor.php');
		mysqli_close($conection);
	}
	$idproveedor = $_REQUEST['id'];

	$sql= mysqli_query($conection,"SELECT * FROM proveedor WHERE codproveedor= $idproveedor ");
	mysqli_close($conection);
	$result_sql = mysqli_num_rows($sql);

	if($result_sql == 0){
		header('Location: lista_proveedor.php');
	}else{

		while ($data = mysqli_fetch_array($sql)) {
			# code...
			$idproveedor    = $data['codproveedor'];
			$proveedor    = $data['proveedor'];
			$contacto       = $data['contacto'];
			$telefono     = $data['telefono'];
			$direccion    = $data['direccion'];
			

			


		}
	}

 ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<?php include "includes/scripts.php"; ?>
	<title>Actualizar Proveedor</title>
</head>
<body>
	<?php include "includes/header.php"; ?>
	<section id="container">
		
		<div class="form_register">
			<h1>Actualizar proveedor</h1>
			<hr>
			<div class="alert"><?php echo isset($alert) ? $alert : ''; ?></div>

         <form action="" method="post">
   <input type= "hidden" name= "id" value="<?php echo $proveedor; ?>">
				<label for="proveedor">Proveedor</label>
<input type="text" name="proveedor" id="proveedor" placeholder="Nombre del Proveedor" value="<?php echo $proveedor ?>">
				<label for="contacto">Contacto</label>
<input type="text" name="contacto" id="contacto" placeholder="Nombre completo del contacto" value="<?php echo $contacto ?>">
				<label for="telefono">Teléfono</label>
<input type="number" name="telefono" id="telefono" placeholder="Teléfono"value="<?php echo $telefono ?>">
			<label for="direccion">Dirección</label>
<input type="text" name="direccion" id="direccion" placeholder="Dirección completa" value="<?php echo $direccion ?>">
				<input type="submit" value="Actualizar Proveedor" class="btn_save">

			</form>


		</div>


	</section>
	<?php include "includes/footer.php"; ?>
</body>
</html>