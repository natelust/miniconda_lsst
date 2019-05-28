get_name()
{
    local py_ver=3
	local mini_ver=4.5.12

	case $(uname -s) in
		Linux*)
			ana_platform="Linux-x86_64"
			;;
		Darwin*)
			ana_platform="MacOSX-x86_64"
			;;
		*)
			n8l::fail "Cannot install miniconda: unsupported platform $(uname -s)"
			;;
	esac


	local miniconda_file_name="Miniconda${py_ver}-${mini_ver}-${ana_platform}.sh"
    echo "$miniconda_file_name"
}

fetch()
{
    :
}

prep()
{
	local miniconda_base_url=https://repo.continuum.io/miniconda
    local miniconda_file_name=$(get_name)

	(
		set -Eeo pipefail
        mkdir -p $PREFIX
        cd $PREFIX

		curl -sSOL "${miniconda_base_url}/${miniconda_file_name}" 

	)
}

build()
{
    :
}

install()
{
    (
        cd $PREFIX
        local miniconda_file_name=$(get_name)
		$cmd bash "$miniconda_file_name" -b -p $PWD/miniconda
        rm $miniconda_file_name
    )
    cp -r ups $PREFIX/
}

