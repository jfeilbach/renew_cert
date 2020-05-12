#/bin/bash
# 17 July 2019
# renew TLS certs

acme='/home/88287/users/.home/acme.sh-2.8.3/acme.sh'
opts='--force --issue'
path='/home/88287/users/.home/.acme.sh'

renew () {
    domain=$1
    echo -e "\nRenewing ${domain}...\n"
    ${acme} ${opts} -d ${domain} -d www.${domain} -w ./domains/${domain}/html/
    echo -e "\n===== ${domain} Key =====\n"
    cat ${path}/${domain}/${domain}.key
    echo -e "\n===== ${domain} Cert =====\n"
    cat ${path}/${domain}/${domain}.cer
    echo -e "\n===== ${domain} CA Cert =====\n"
    cat ${path}/${domain}/ca.cer
}

case "$1" in
    domain )
        renew domain.com
    ;;
    domain2 )
        renew domain2.com
    ;;
    *)
    echo $"Usage: $0 {foo|bar|baz|qux}"
    exit 1
esac

exit 0
