#!/bin/bash

MODULES=( )
PYTHON=python3.6
VENV=venv
FRESH_INSTALL=1

function install()
{
	source $VENV/bin/activate && \
		pip install --upgrade pip && \
		pip install pynvim && \
		deactivate
}

for MODULE in "${MODULES[@]}"
do
	module load $MODULE
done

if [ "$FRESH_INSTALL" -gt 0 ]
then
	echo -e "Creating new environment..."
	rm -rf $VENV
	$PYTHON -m venv $VENV
fi

install || deactivate

echo -e ""
echo -e "Command to activate environment:"
echo -e "\t\$ source $VENV/bin/activate"
echo -e ""
echo -e "Command to deactivate environment:"
echo -e "\t\$ deactivate"
echo -e ""
