```bash
#!/bin/bash

cert_dir="/etc/haproxy/ssl/certs"
warning_days=15

# Function to check if a certificate is about to expire
check_cert_expiration() {
  cert_file=$1
  expiration_date=$(openssl x509 -noout -enddate -in "$cert_file" | cut -d '=' -f 2)
  expiration_timestamp=$(date -d "$expiration_date" +%s)
  current_timestamp=$(date +%s)
  difference=$((expiration_timestamp - current_timestamp))
  difference_in_days=$((difference / 60 / 60 / 24))
  if [ $difference_in_days -le $warning_days ]; then
    echo "Certificate $cert_file will expire in $difference_in_days days."
    echo "Certificate $cert_file will expire in $difference_in_days days."|mailx -a 'Content-Type: text/html' -s "Client $HOSTNAME - expiration ssl" me@gmail.com
  fi
}

# Loop through all the certificates in the directory
for cert_file in "$cert_dir"/*.pem; do
  check_cert_expiration "$cert_file"
done
```