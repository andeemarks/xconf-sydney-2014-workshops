#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MD5=$( which md5 2>/dev/null || which md5sum 2>/dev/null )

function download {
	URL=$1
	FILE_NAME=$( basename ${URL} )
	echo "Downloading ${FILE_NAME}"
	curl -Ls "${URL}" -o "${DIR}/${FILE_NAME}"
}

function get_md5 {
	FILE_PATH=$1
	if [ "$( basename ${MD5} )" == "md5" ]; then
		${MD5} -q ${FILE_PATH}
	else
		${MD5} ${FILE_PATH} | awk '{ print $1 }'
	fi
}

function download_if_required {
	URL=$1
	EXPECTED_HASH=$2
	FILE_NAME=$( basename ${URL} )
	FILE_PATH="${DIR}/${FILE_NAME}"

	if [ ! -e ${FILE_PATH} ]; then
		download $URL
	else
		HASH=$( get_md5 ${FILE_PATH} )
		if [ "${HASH}" != "${EXPECTED_HASH}" ]; then
			rm -f ${FILE_PATH}
			download $URL
		else
			echo "${FILE_NAME} already downloaded."
		fi
	fi
}

download_if_required "http://download.go.cd/gocd-rpm/go-agent-14.2.0-377.noarch.rpm" 8795f198c8c5a76c7be572171b8619d0
download_if_required "http://download.go.cd/gocd-rpm/go-server-14.2.0-377.noarch.rpm" aa00b28cf6ac9a74d38805d5975e6774
download_if_required "https://www.dropbox.com/s/ybvwo9r3r68fh0x/jdk-7u67-linux-x64.rpm" 3209c90d10ca86e5c384f3aa6ad25bba
download_if_required "https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz" c91847e63449d982f53ba94bacc99d50
