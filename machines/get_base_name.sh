#!/bin/sh
# Get a base name for an image from a name which comes from the command line
while [ "$#" -ge 1 ]
do
    NAME="$1"

    # Drop "Dockerfile-" prefix, which allows using file name completion
    NAME="${NAME#*Dockerfile-}"

    # Drop special symbols and make lowercase
    NAME="$(echo "$NAME" | tr -cd 'a-zA-Z0-9.' | tr '[:upper:]' '[:lower:]')"

    # Recognize keywords
    case "$NAME" in
        *arch*)
            echo "archlinux"
            ;;

        *alpine33*|*alpine3.3*)
            echo "alpine3.3"
            ;;
        *alpine34*|*alpine3.4*)
            echo "alpine3.4"
            ;;
        *alpine35*|*alpine3.5*)
            echo "alpine3.5"
            ;;
        *alpine36*|*alpine3.6*)
            echo "alpine3.6"
            ;;
        *alpine37*|*alpine3.7*)
            echo "alpine3.7"
            ;;
        *alpine38*|*alpine3.8*)
            echo "alpine3.8"
            ;;

        *debian7*|*wheezy*)
            echo "debian7-wheezy"
            ;;
        *debian8*|*jessie*)
            echo "debian8-jessie"
            ;;
        *debian9*|*stretch*)
            echo "debian9-stretch"
            ;;
        *debian10*|*buster*)
            echo "debian10-buster"
            ;;

        *ubuntu1204*|*ubuntu12.04*|*precise*)
            echo "ubuntu1204-precise"
            ;;
        *ubuntu1404*|*ubuntu14.04*|*trusty*)
            echo "ubuntu1404-trusty"
            ;;
        *ubuntu1604*|*ubuntu16.04*|*xenial*)
            echo "ubuntu1604-xenial"
            ;;
        *ubuntu1804*|*ubuntu18.04*|*bionic*)
            echo "ubuntu1804-bionic"
            ;;

        *fedora22*)
            echo "fedora22"
            ;;
        *fedora23*)
            echo "fedora23"
            ;;
        *fedora24*)
            echo "fedora24"
            ;;
        *fedora25*)
            echo "fedora25"
            ;;
        *fedora26*)
            echo "fedora26"
            ;;
        *fedora27*)
            echo "fedora27"
            ;;
        *fedora28*)
            echo "fedora28"
            ;;
        *fedora29*)
            echo "fedora29"
            ;;

        *)
            echo >&2 "Error: invalid name $NAME (from $1)"
            exit 1
            ;;
    esac
    shift
done