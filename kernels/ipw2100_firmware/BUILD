echo "makeing hotplug dir"
[ ! -d /usr/lib/hotplug/firmware ] && mkdir -p /usr/lib/hotplug/firmware  
echo "makeing ipw dir"
[ ! -d $SOURCE_DIRECTORY ] && mkdir -p $SOURCE_DIRECTORY 
echo "cding into dir and untaring" 
cd $SOURCE_DIRECTORY  && tar -xvzf /var/spool/sorcery/$SOURCE  
extras="`ls $SOURCE_DIRECTORY`"
echo "license agreement"

less $SOURCE_DIRECTORY/LICENSE  

# because the tarball is just files and no dir *lame* 
for x in $extras
do
	rm /usr/src/$x
done

if ! query "Do you agree to the terms of the license?" y; then
	rm $SOURCE_DIRECTORY/*
	return 1 
else
	cp $SOURCE_DIRECTORY/*.fw /usr/lib/hotplug/firmware/
	return 0
fi
