echo "makeing hotplug dir"
[ ! -d /usr/lib/hotplug/firmware ] && mkdir -p /usr/lib/hotplug/firmware
echo "makeing ipw dir"
[ ! -d $SOURCE_DIRECTORY ] && mkdir -p $SOURCE_DIRECTORY
echo "cding into dir and untaring"
cd $SOURCE_DIRECTORY  && tar -xvzf /var/spool/sorcery/$SOURCE
echo "license agreement"

more $SOURCE_DIRECTORY/LICENSE &&

if ! query "Do you agree to the terms of the license?" y; then
        rm $SOURCE_DIRECTORY/*
        return 1
fi
return 0

# again don't quite know what to do about the license stuff

echo "moving files"
mv $SOURCE_DIRECTORY/*.fw /usr/lib/hotplug/firmware/
