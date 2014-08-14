#!/bin/bash

function download {
	URL=$1
	FILE_NAME=$( basename ${URL} )
	echo "Downloading ${FILE_NAME}"
	curl -Ls "${URL}" -o "${FILE_NAME}"
}

function download_if_required {
	URL=$1
	EXPECTED_MD5=$2
	FILE_NAME=$( basename ${URL} )

	if [ ! -e ${FILE_NAME} ]; then
		download $URL
	else
		MD5=$( md5 -q ${FILE_NAME} )
		if [ "${MD5}" != "${EXPECTED_MD5}" ]; then
			rm -f ${FILE_NAME}
			download $URL
		else
			echo "${FILE_NAME} already download."
		fi
	fi
}

# download_if_required "http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb" 0d40b050db745733bf79102d708d4106
# download_if_required "http://download.go.cd/gocd-deb/go-server-14.2.0-377.deb" e186360644197b875b00177cf1c46263
# download_if_required "https://www.dropbox.com/s/ilfjs5qh12a086y/jdk-7u67-linux-x64.gz" 81e3e2df33e13781e5fac5756ed90e67

download_if_required "http://download.go.cd/gocd-rpm/go-agent-14.2.0-377.noarch.rpm" 8795f198c8c5a76c7be572171b8619d0
download_if_required "http://download.go.cd/gocd-rpm/go-server-14.2.0-377.noarch.rpm" aa00b28cf6ac9a74d38805d5975e6774
download_if_required "https://www.dropbox.com/s/ybvwo9r3r68fh0x/jdk-7u67-linux-x64.rpm" 3209c90d10ca86e5c384f3aa6ad25bba
