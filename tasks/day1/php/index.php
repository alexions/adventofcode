<?php

$file_path = $argv[1];
$brackets = trim(file_get_contents($file_path));

$strlen = strlen($brackets);
$level = 0;
$basemant_level = null;

for ($i = 0; $i < $strlen; $i++) {
    $brackets[$i] == '(' ? $level++ : $level--;
    if (is_null($basemant_level) && $level < 0) {
        $basemant_level = $i + 1;
    }
}

echo 'Level: ' . $level . PHP_EOL;
echo 'Basemant: ' . $basemant_level . PHP_EOL;