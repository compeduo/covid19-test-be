<?php
include "./functions.php";
$form = new Form();

header("Access-Control-Allow-Origin: https://covid19-tester.cz");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");

$requestMethod = $_SERVER["REQUEST_METHOD"];
if ($requestMethod == "OPTIONS") {
    http_response_code(200);
    exit(0);
}
if ($requestMethod != "POST") {
    http_response_code(400);
    die("Not a POST method");
}

// Takes raw data from the request
$content = file_get_contents("php://input"); // Read body
// Converts it into a PHP object
if ($content == null) {
    die("Content je null!");
}

$data = (array)json_decode($content, TRUE);
if ($data == null) {
    http_response_code(400);
    die("Data are null!");
}

echo "Processing: \n";
print_r($content);

if ($form->save($data['phone'], $data['fever'], $data['longFever'], $data['breathing'], $data['cough'], $data['old'])) {
    // pokud dojde k ulozeni
    http_response_code(200);
} else {
    // pokud selze ulozeni
    http_response_code(500);
}
