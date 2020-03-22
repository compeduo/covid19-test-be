<?php
	
	
	/**
	* Save Form
	*/
	class Form {
	
		private $connection;

		function __construct() {
		    $this->connection = new mysqli("md42.wedos.net", "a215516_covid", "W4CRSWGD", "d215516_covid");
		}

// 
		function save($phone, $fever , $longFever, $breathing, $cough, $old) {
//			$sql = $this->connection->prepare("INSERT INTO form (phone, fever ,long_fever, breathing, cough, old) VALUES (? ,? ,? ,? ,? ,?)");
//			$sql->bind_param("siiiii", $phone, $fever ,$longFever, $breathing, $cough, $old);
//			if ($sql->execute()) {
//				$status = true;
//			}
//			else {
//				$status = false;
//			}

            echo "Going to save now ..";
			if ($this->connection->query("INSERT INTO form SET phone='$phone', fever='$fever', longFever='$longFever', breathing='$breathing', cough='$cough', old='$old'")) {
				$status = true;
			}
			else {
				$status = false;
			}

			return $status;
		}
	}
	