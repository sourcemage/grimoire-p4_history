# CPP SOURCE FILES
.SUFFIXES: .o .cpp

# use the following command to regenerate the object list
#ls -Rd /usr/src/flamerobin*/src/*|grep ".cpp"|cut -d/ -f6-| sed "s/\.cpp/\.o\\ /"

OBJECTS=\
	metadata/metadataitem.o metadata/database.o metadata/root.o metadata/server.o metadata/domain.o \
	metadata/column.o metadata/table.o metadata/view.o metadata/parameter.o metadata/procedure.o \
	metadata/metadataitemwithcolumns.o metadata/generator.o metadata/trigger.o metadata/exception.o \
	metadata/function.o metadata/role.o metadata/constraints.o \
	gui/BackupRestoreBaseFrame.o gui/BackupFrame.o gui/RestoreFrame.o \
	gui/DatabaseRegistrationDialog.o gui/ExecuteSqlFrame.o \
	gui/FindDialog.o gui/MetadataItemPropertiesFrame.o \
	gui/MultilineEnterDialog.o gui/PreferencesDialog.o \
	gui/PreferencesDialogSettings.o gui/ReorderFieldsDialog.o \
	gui/ServerRegistrationDialog.o \
	addconstrainthandler.o BaseDialog.o BaseFrame.o config.o converters.o \
	dberror.o FieldPropertiesFrame.o FieldPropertiesFrameImpl.o \
	frDataGridCells.o frDataGrid.o frDataGridTable.o frutils.o \
	images.o logger.o main.o MainFrame.o MainFrameImpl.o myTreeCtrl.o \
	objectdescriptionhandler.o observer.o simpleparser.o \
	styleguide.o styleguidegeneric.o  \
	subject.o treeitem.o ugly.o urihandler.o

# Path where IBPP .o and .a files can be found
IBPP_INC=/usr/include
IBPP_LIB=/usr/lib
# Compiler & linker flags
WX=`wx-config --cxxflags`
# You may need to change wxgtk-2.4-config to wx-config or similar
COMPILE_FLAGS=-DIBPP_LINUX -DIBPP_GCC -I. -I../res -I$(IBPP_INC) $(WX)
# determine installed version of library
LINK_FLAGS=`wx-config --libs` -lwx_gtk2_stc-`wx-config --version|cut -c-3`


# Name of the executable
PROGRAM=flamerobin

.cpp.o:
	g++ -c $(COMPILE_FLAGS) $(CFLAGS) -o $@ $<

all:	$(PROGRAM)

$(PROGRAM):	$(OBJECTS)
	g++ -libpp $(OBJECTS) -o$(PROGRAM) $(LINK_FLAGS) $(LDFLAGS)


