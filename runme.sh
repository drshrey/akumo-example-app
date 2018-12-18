#!/bin/bash

# test docker builder

r=$(( $RANDOM % 255 ))
g=$(( $RANDOM % 255 ))
b=$(( $RANDOM % 255 ))

cat << EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to ${DEPLOYTEST}</title>
<style>
.Main {
  margin: auto;
  text-align: center;
  font-family: Arial;
  background: ${BACKGROUND};
}
</style>
</head>
<body>
<div class="Main">
<h1>Welcome to Kumo - ${DEPLOYTEST}!</h1>
</div>
</body>
</html>
EOF

if [[ -z "$ENV_TEST" ]]; then 
	echo "Exiting due to lack of environment variable: ENV_TEST" > /dev/stderr
	exit 123
fi

exec /usr/sbin/nginx -g "daemon off;"
