#!/bin/bash

readonly WORK_DIR="$(realpath $(dirname "$0")/..)"
readonly SHARED_YOCTO_LOCATION="${3}"
readonly VENV_DIR="${WORK_DIR}/kas_venv"

print_help() {
	echo "USAGE: ./start_container.sh checkout|build|shell YAML_FILE SHARED_YOCTO_LOCATION"
}

# TODO: add option not to force shared Downloads and sstate-cache 
if [[ $# -ne 3 ]]; then
	print_help
	exit 1
fi

log(){
	echo "[INFO] $*"
}

error(){
	echo "[ERROR] $*" >&2
	exit 1
}

do_kas() {
	local cmd="${1}"
	local yml="${2}"

	case "${cmd}" in
		checkout|build|shell);;
		*)
			print_help
			error "Wrong command selected!"
		;;
	esac

	[[ -f "${yml}" ]] || error "File does not exist"

	kas-container \
		--runtime-args "-v ${SHARED_YOCTO_LOCATION}:/YoctoShare" \
		 "${cmd}" "${yml}"
}

prepare_env() {
	log "Checking whether a virtual environment is running"

	if [[ -z "${VIRTUAL_ENV}" ]]; then
		log "No running virtual environment was detected"
		
		if [[ ! -d "${VENV_DIR}" ]]; then
			log "Creating virtual environment"
			/usr/bin/python3 -m venv "${VENV_DIR}" || error "Failed to create virtual environment"
		fi

		log "Activating virtual environment"
		source "${VENV_DIR}/bin/activate" || error "Failed to activate virtual environment"
	else 
		log "Detected a running virtual environment"
	fi
		
	log "Ensuring kas is installed"
	if ! pip show kas &>/dev/null; then
		pip install kas || error "Failed to install KAS"
	fi 
}

main() {
	prepare_env

	[[ -d "${SHARED_YOCTO_LOCATION}" ]] || error "The provided location is not a directory"

	for dir in downloads sstate-cache; do
		[[ -d "${SHARED_YOCTO_LOCATION}/${dir}" ]] || error "Missing ${dir} directory under ${SHARED_YOCTO_LOCATION}"
	done
	
	export KAS_WORK_DIR=${WORK_DIR}

	do_kas $1 $2
}

main "$@"