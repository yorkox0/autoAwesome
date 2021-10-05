#!/bin/bash

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function banner(){

	clear

	echo -e "${red}"

	echo " █████╗ ██╗   ██╗████████╗ ██████╗ ██████╗ ███████╗██████╗ ██╗    ██╗███╗   ███╗██████╗ " 
	echo "██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝██╔══██╗██║    ██║████╗ ████║╚════██╗"
	echo "███████║██║   ██║   ██║   ██║   ██║██████╔╝███████╗██████╔╝██║ █╗ ██║██╔████╔██║ █████╔╝"
	echo "██╔══██║██║   ██║   ██║   ██║   ██║██╔══██╗╚════██║██╔═══╝ ██║███╗██║██║╚██╔╝██║██╔═══╝ "
	echo "██║  ██║╚██████╔╝   ██║   ╚██████╔╝██████╔╝███████║██║     ╚███╔███╔╝██║ ╚═╝ ██║███████╗"
	echo "╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝╚═╝      ╚══╝╚══╝ ╚═╝     ╚═╝╚══════╝"

}

function menu(){

	banner

	echo -e "${blue}"

	sleep 0.25
	echo
	echo "1 -> Instalar dependencias"
	sleep 0.25
	echo
	echo "2 -> Instalar Bspwm"
	sleep 0.25
	echo
	echo "3 -> Instalar Polybar"
	sleep 0.25
	echo
	echo "4 -> Instalar tema de Polybar"
	sleep 0.25
	echo
	echo "5 -> Instalar elementos adicionales: rofi, caja, firefox..."
	sleep 0.25
	echo
	echo "6 -> Instalar todo"
	sleep 0.25
	echo
	echo "7 -> Salir"
	sleep 0.25

	echo
	read -p "--> " comando

	if [ "$comando" == "1" ]; then
		bash scripts/dependencias
		fi

        if [ "$comando" == "2" ]; then
                bash scripts/bspwm
                fi

        if [ "$comando" == "3" ]; then
                bash scripts/polybar-build
                fi

        if [ "$comando" == "4" ]; then
                bash scripts/polybar-theme
                fi

        if [ "$comando" == "5" ]; then
                bash scripts/tools
                fi

        if [ "$comando" == "6" ]; then
                bash scripts/dependencias
		bash scripts/bspwm
		bash scripts/polybar-build
		bash scripts/polybar-theme
		bash scripts/tools
                fi
}

username=$(whoami)

if [ "$(id -u)" == "0" ]; then
	echo -e "\n${red}[!] No hay que ser root para ejecutar la herramienta${end}"
	echo
	exit 1
else
	menu
fi
