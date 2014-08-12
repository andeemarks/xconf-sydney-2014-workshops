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

download_if_required "https://www.dropbox.com/s/7y6m30oaor8f43a/go-agent-14.2.0-377.noarch.rpm" 8795f198c8c5a76c7be572171b8619d0
download_if_required "https://www.dropbox.com/s/egd1rkv8ub55foz/go-server-14.2.0-377.noarch.rpm" aa00b28cf6ac9a74d38805d5975e6774
download_if_required "https://www.dropbox.com/s/ybvwo9r3r68fh0x/jdk-7u67-linux-x64.rpm" 3209c90d10ca86e5c384f3aa6ad25bba
