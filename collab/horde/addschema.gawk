{
	if ($0 ~ /^include\W+.*\.schema/)
		previous_include = 1
	else {
		if (previous_include == 1 && include_complete != 1) {
			print "include		/etc/openldap/schema/gollem.schema"
			print "include		/etc/openldap/schema/horde.schema"
			print "include		/etc/openldap/schema/imp.schema"
			print "include		/etc/openldap/schema/kronolith.schema"
			print "include		/etc/openldap/schema/nag.schema"
			print "include		/etc/openldap/schema/turba.schema"
			include_complete = 1
		}
		previous_include=0
	}
	print
}
