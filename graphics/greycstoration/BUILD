sedit "s:CXXFLAGS=-Wall -O3 -ffast-math:CXXFLAGS=$CXXFLAGS -Wall -ffast-math:" Makefile &&
sedit 's:@$(CXX) -o $(PROG) $(OBJECTS) $(CXXFLAGS) $(LIBS):$(CXX) -o $(PROG) $(OBJECTS) $(CXXFLAGS) $(LIBS):' Makefile &&
sedit 's:@$(CXX) -c -o $@ $< $(CXXFLAGS):$(CXX) -c -o $@ $< $(CXXFLAGS):' Makefile      &&
sedit 's:$(GIMPTOOL) --install-bin $(PROG):$(GIMPTOOL) --install-admin-bin $(PROG):' Makefile	&&
make
