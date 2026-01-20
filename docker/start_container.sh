#!/bin/bash

print_help() {
	echo "USAGE: ./start_container.sh checkout|build|shell YML_FILE SHARED_YOCTO_LOCATION"
}

if [ $# -ne 3 ]; then
	print_help
	exit 1
fi

WORK_DIR="$(dirname $(pwd))"
SHARED_YOCTO_LOCATION="${3}"
VENV_DIR="${WORK_DIR}/kas_venv"

prepare_env() {
	# TODO: this function could be improved in the future.
	echo "[INFO] Checking whether a virtual environment is running."
	if [ ! -z "${VIRTUAL_ENV}" ]; then
		echo "[INFO] Detected a running virtual environment."
		if pip list | grep kas &>/dev/null; then
			echo "[INFO] KAS is already installed."
		else
			if ! pip install kas; then
				echo "[ERROR] Failed to install Kas"
				exit 1
			fi
		fi
	else
		echo "[INFO] No running virtual environment was detected."
		echo "[INFO] Checking if the virtual environment directory exists."
		if [ -d "${VENV_DIR}" ]; then
			echo "[INFO] Virtual environment directory detected."
			echo "[INFO] Sourcing the environment."
			if ! source "${VENV_DIR}/bin/activate"; then
				echo "[ERROR] Failed to source the environment. Try deleting the kas_venv folder and running the script again."
				exit 1
			fi
		else
			if ! /usr/bin/python3 -m venv "${VENV_DIR}"; then
				echo "[ERROR] Failed to create virtual environment"
				exit 1
		 	fi
		fi
	fi
}

do_kas() {
	local CMD="${1}"
	local YML_FILE="${2}"
	kas-container \
		--runtime-args "-v ${SHARED_YOCTO_LOCATION}:/YoctoShare" \
		 "${CMD}" "${YML_FILE}"
}

main() {
	prepare_env
	local CMD="${1}"
	local YML="${2}"

	if [ "${CMD}" != "checkout" -a "${CMD}" != "build" -a "${CMD}" != "shell" ]; then
		echo "[ERROR] Wrong command selected!"
		print_help
		exit 1
	fi

	if [ ! -f "${YML}" ]; then
		echo "[ERROR] File does not exist."
		exit 1
	fi

	if [ ! -d "${SHARED_YOCTO_LOCATION}" ]; then
		echo "[ERROR] The provided location is not a directory."
		exit 1
	else
		if [ ! -d "${SHARED_YOCTO_LOCATION}/downloads" -o ! -d "${SHARED_YOCTO_LOCATION}/sstate-cache" ]; then
			echo "[ERROR] Make sure downloads and sstate-cache directories are located under ${SHARED_YOCTO_LOCATION}"
			exit 1
		fi
	fi

	do_kas "${CMD}" "${YML}"
}

main "$@"