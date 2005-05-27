# CPP SOURCE FILES
.SUFFIXES: .o .cpp

OBJECTS=\
	metadata/metadataitem.o metadata/database.o metadata/root.o metadata/server.o metadata/domain.o \
	metadata/column.o metadata/table.o metadata/view.o metadata/parameter.o metadata/procedure.o \
	metadata/metadataitemwithcolumns.o metadata/generator.o metadata/trigger.o metadata/exception.o \
	metadata/function.o metadata/role.o metadata/constraints.o \
	BaseFrame.o BaseDialog.o MainFrame.o MainFrameImpl.o \
	gui/BackupRestoreBaseFrame.o gui/BackupFrame.o gui/RestoreFrame.o \
	styleguide.o styleguidegeneric.o \
	DatabaseRegistrationInfoFrame.o DatabaseRegistrationInfoFrameImpl.o \
	ServerRegistrationInfoFrame.o ServerRegistrationInfoFrameImpl.o \
	ExecuteSqlFrame.o ExecuteSqlFrameImpl.o MultilineEnterDialog.o \
	MetadataItemPropertiesDialog.o MetadataItemPropertiesDialogImpl.o \
	FieldPropertiesFrame.o FieldPropertiesFrameImpl.o \
	ReorderFieldsDialog.o ReorderFieldsDialogImpl.o \
	subject.o observer.o treeitem.o myTreeCtrl.o myDataGrid.o frutils.o \
	urihandler.o objectdescriptionhandler.o addconstrainthandler.o \
	images.o ugly.o converters.o dberror.o config.o main.o

# Path where IBPP .o and .a files can be found
IBPP_INC=/usr/include
IBPP_LIB=/usr/lib
# Compiler & linker flags
# You may need to change wxgtk-2.4-config to wx-config or similar
COMPILE_FLAGS=-DIBPP_LINUX -DIBPP_GCC -I. -I$(IBPP_INC) `wx-config --cxxflags`
# determine installed version of library
LINK_FLAGS=`wx-config --libs` -lwx_gtk2_stc-`wx-config --version|cut -c-3`


# Name of the executable
PROGRAM=flamerobin

.cpp.o:
	g++ -c $(COMPILE_FLAGS) $(CFLAGS) -o $@ $<

all:	$(PROGRAM)

$(PROGRAM):	$(OBJECTS)
	g++ -libpp $(OBJECTS) -o$(PROGRAM) $(LINK_FLAGS) $(LDFLAGS)


