# Attempt is made here to lock in Webmin configuration,
# making it more predictable and secure.
# Port and password are generated using week random
# generators, but that may still be better than human.
# These values will be preserved in the compile log,
# making it possible to recover.

(

	readonly ALPHABET="1234567890abcdefghijklmnopqrstuvxyz"

	config_dir=/etc/webmin
	var_dir=/var/log/webmin
	perl=`which perl`
	autoos=1
	host=`hostname`
	port=$((RANDOM + 1024))
	atboot=1
	ssl=0
	spell_installed Net-SSLeay && ssl=1
	login=admin
	password=
	for (( C = 0; C < 8; ++C )) do
		password="${password}${ALPHABET:RANDOM % 36:1}"
	done

	patch -p1 < $SCRIPT_DIRECTORY/$SPELL.patch
	prepare_install &&
	./setup.sh

) > $C_FIFO 2>&1
