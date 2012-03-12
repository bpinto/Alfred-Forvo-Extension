<?php
	
  //Include HTML DOM Parser
  include('simple_html_dom.php');

	// grab user input
	$comm = $argv[1];

	// display the about info for this extension
	if ($comm == "about") {

		echo "Forvo Pronunciator is an extension created by Bruno Pinto (@pfbruno) that makes it easy to search and listen to Forvo's pronunciations. This extension will scan Forvo for the searched pronunciation and then play it.";
		exit(1);
		
	} // end if about

	// display the version info for this extension
	else if ($comm == "version") {
			
		// if update.xml exists, display version info
		if (file_exists("update.xml")) {
			$xml = simplexml_load_file("update.xml");
			echo "Extension Updater $xml->version";
		}

		// if update.xml doesn't exist, show an error
		else {
			echo "No version information found for this extension";
		}

		exit(1);

	} // end else version

	// display the changelog for this extension
	else if ($comm == "changelog") {
		
		// if changelog exists, show contents
		if (file_exists("changelog.txt")) {

			$f = fopen("changelog.txt", "r");
			while ($output = fgets($f)) {
				echo $output."\r";
			}
			fclose($f);

		}

		// if changelog doesn't exist, display error
		else {
			echo "No changelog found.";
		}
		exit(1);

	} // end else changelog

  //Search forvo for pronunciations
  $search_url= "http://www.forvo.com/word/" . $comm . "/#de";

  //Get via cURL and save response
  $crl = curl_init();
  curl_setopt ( $crl, CURLOPT_URL, $search_url );
  curl_setopt ( $crl, CURLOPT_RETURNTRANSFER, 1 );
  curl_setopt ( $crl, CURLOPT_CONNECTTIMEOUT, 10);
  $ret = curl_exec( $crl );
  curl_close( $crl );

  //Parse the HTML DOM
  $search_html = str_get_html( $ret );

  if (!$search_html) {
    echo "Internet connection failed";
  } else {
    $mp3_path= $search_html->find("a[onclick^=Play]", 0)->onclick;
    $parameters = explode(",", $mp3_path);

    if ($parameters[1]) {
      echo "http://audio.forvo.com:80/mp3/" . base64_decode($parameters[1]);
    } else {
      echo "No mp3 found";
    }
  }

?>

