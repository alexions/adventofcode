<?php

require('present.php');

$file_path = $argv[1];
$content = trim(file_get_contents($file_path));
$dimensions = explode("\n", $content);

$total_square_feets = 0;
$ribon_length = 0;

foreach ($dimensions as $dimension) {
    list($length, $width, $height) = explode('x', $dimension);
    $present = new Present($length, $width, $height);
    $total_square_feets += $present->getSquare();
    $ribon_length += $present->getRibonLenght();
}

echo 'Total square feets: ' . $total_square_feets . PHP_EOL;
echo 'Ribon length: ' . $ribon_length . PHP_EOL;