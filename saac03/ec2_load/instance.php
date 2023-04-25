<?php
/**This PHP page retrieves values from the EC2 Meta-data on the local instance
**/
$instance_id = file_get_contents("http://169.254.169.254/latest/meta-data/instance-id");
$private_ipv4 = file_get_contents("http://169.254.169.254/latest/meta-data/local-ipv4");
$local_hostname = file_get_contents("http://169.254.169.254/latest/meta-data/local-hostname");
echo "Instance ID : ", $instance_id, "\r\n";
echo "<br>";
echo "Private IPv4 : ", $private_ipv4, "\r\n";
echo "<br>";
echo "Local Hostname : ", $local_hostname, "\r\n";
 ?>