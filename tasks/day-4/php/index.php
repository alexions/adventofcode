<?php

$file_path = $argv[1];
$puzzle = trim(file_get_contents($file_path));

$index_5 = get_hash_cond_index($puzzle, function($hash){
    return substr($hash, 0, 5) === '00000';
});

$index_6 = get_hash_cond_index($puzzle, function($hash){
    return substr($hash, 0, 6) === '000000';
});

echo '5-0 index: ' . $index_5 . PHP_EOL;
echo '6-0 index: ' . $index_6 . PHP_EOL;

function get_hash_cond_index($puzzle, $condition_func) {
    for ($i = 0; ; $i++) {
        $hash = md5($puzzle . $i);
        if ($condition_func($hash)) {
            return $i;
        }
    }
}