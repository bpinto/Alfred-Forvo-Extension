<?php

	$url = $argv[1]; 
  $save_to='/tmp/';

  $ch = curl_init();

  curl_setopt($ch, CURLOPT_URL, $url);

  $fp = fopen($save_to . '/' . basename($url), 'w');

  // Set CURL to write to disk
  curl_setopt($ch, CURLOPT_FILE, $fp);

  // Execute download
  curl_exec ($ch);
  curl_close ($ch);

  fclose($fp);

?>

