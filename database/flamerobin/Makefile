# CPP SOURCE FILES
.SUFFIXES: .o .cpp

OBJECTS=\
	metadata/metadataitem.o metadata/database.o metadata/root.o metadata/server.o \
	metadata/column.o metadata/table.o metadata/view.o metadata/parameter.o metadata/procedure.o \
	MainFrame.o MainFrameImpl.o \
	DatabaseRegistrationInfoFrame.o DatabaseRegistrationInfoFrameImpl.o \
	ServerRegistrationInfoFrame.o ServerRegistrationInfoFrameImpl.o \
	ExecuteSqlFrame.o ExecuteSqlFrameImpl.o \
	subject.o observer.o treeitem.o myTreeCtrl.o myDataGrid.o \
	ugly.o converters.o config.o main.o

# Path where IBPP .o and .a files can be found
IBPP_INC=/usr/include
IBPP_LIB=/usr/lib
# Compiler & linker flags
# You may need to change wxgtk-2.4-config to wx-config or similar
COMPILE_FLAGS=-DIBPP_LINUX -DIBPP_GCC -I. -I$(IBPP_INC) `wx-config --cxxflags`
LINK_FLAGS=`wx-config --libs` -lwx_gtk2_stc-2.4


# Name of the executable
PROGRAM=flamerobin

.cpp.o:
	g++ -c $(COMPILE_FLAGS) $(CFLAGS) -o $@ $<

all:	$(PROGRAM)

$(PROGRAM):	$(OBJECTS)
	g++ -libpp $(OBJECTS) -o$(PROGRAM) $(LINK_FLAGS) $(LDFLAGS)


