<?php
include "./functions.php";
$form = new Form();

$requestMethod = $_SERVER["REQUEST_METHOD"];
if ($requestMethod == "POST") {
    $content = file_get_contents('php://input');

    // WTF?
    if ($content == null) {
        echo "Content je null!";
    }

    $data = (array)json_decode($content, TRUE);
    if ($data == null) {
        http_response_code(400);
    }

    if ($form->save($data['phone'], $data['fever'], $data['long_fever'], $data['breathing'], $data['cough'], $data['old'])) {
        // pokud dojde k ulozeni
        http_response_code(200);
    } else {
        // pokud selze ulozeni
        http_response_code(500);
    }

} else {
    // pokud neni post
    http_response_code(400);
}