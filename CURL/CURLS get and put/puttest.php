<?php

if($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo "this is a get request\n";
    echo $_GET['fruit']." is the fruit\n";
    echo "I want ".$_GET['quantity']." of them\n\n";
} elseif($_SERVER['REQUEST_METHOD'] == 'PUT') {
    echo "this is a put request\n";
    parse_str(file_get_contents("php://input"),$post_vars);
    echo $post_vars['fruit']." is the fruit\n";
    echo "I want ".$post_vars['quantity']." of them\n\n";
}

?>
