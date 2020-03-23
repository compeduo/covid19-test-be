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
        $sql = $this->connection->prepare("INSERT INTO form (phone, fever ,long_fever, breathing, cough, old) VALUES (? ,? ,? ,? ,? ,?)");
        $sql->bind_param("siiiii", intval($phone), intval($fever) ,intval($longFever), intval($breathing), intval($cough), intval($old));
        if ($sql->execute()) {
            $status = true;
            echo "New record created successfully. Last inserted ID is: " . $this->connection->insert_id;
        }
        else {
            $status = false;
        }

        return $status;
    }
}
	