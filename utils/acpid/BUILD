(

  make                                                                &&
  prepare_install                                                     &&
  make    install                                                     &&

  if [ ! -d /etc/acpi ] ; then
    mkdir /etc/acpi                                                   &&
    mkdir /etc/acpi/events                                            &&
    mkdir /etc/acpi/actions                                           &&
    cp $SOURCE_DIRECTORY/samples/sample.conf /etc/acpi/events         &&
    cp $SOURCE_DIRECTORY/samples/acpi_handler.sh /etc/acpi/actions    &&
    cp $SOURCE_DIRECTORY/debian/default /etc/acpi/events              &&
    cp $SOURCE_DIRECTORY/debian/default.sh /etc/acpi/
  else
    if [ ! -d /etc/acpi/events ] ; then
      mkdir /etc/acpi/events
    fi

    if [ ! -d /etc/acpi/actions ] ; then
      mkdir /etc/acpi/actions
    fi

    if [ ! -a /etc/acpi/events/sample.conf ] ; then
      cp $SOURCE_DIRECTORY/samples/sample.conf /etc/acpi/events
    fi

    if [ ! -a /etc/acpi/actions/acpi_handler.sh ] ; then
      cp $SOURCE_DIRECTORY/samples/acpi_handler.sh /etc/acpi/actions
    fi

    if [ ! -a /etc/acpi/events/default ] ; then
      cp $SOURCE_DIRECTORY/debian/default /etc/acpi/events
    fi

    if [ ! -a /etc/acpi/default.sh ] ; then
      cp $SOURCE_DIRECTORY/debian/default.sh /etc/acpi
    fi
  fi

) > $C_FIFO 2>&1
