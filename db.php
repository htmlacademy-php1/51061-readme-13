<?php

$con = mysqli_connect('localhost', "root", "", 'readme');
mysqli_set_charset($con, 'utf8');
if (!$con) {
    print ('Соединение не удалось!' . mysqli_connect_error());
}
