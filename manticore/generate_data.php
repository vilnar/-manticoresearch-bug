<?php

function generateRandomString($length = 5)
{
    $characters = '0123456789,.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $max = mb_strlen($characters) - 1;
    $result = "";
    for ($i = 0; $i < $length; $i++) {
        $result .= mb_substr($characters, rand(0, $max), 1);
    }
    return $result;
}

for ($n = 1; $n <= 1000; $n++) {
    $randomString = generateRandomString() . " " . generateRandomString(7) . " " . generateRandomString(8);

    $f = $randomString;
    $a = rand(0, 100);

    printf("%s|%s|%s\n", $n, $f, $a);
}
