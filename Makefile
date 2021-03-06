# Makefile
# 
# @author Dominik Simek
# @author Filip Listiak
#
# FIT VUT, ZPO 2016/2017

CXX=g++
CXXFLAGS=-std=c++11 -O2 -g -Wall -I. -I/usr/local/include
LDFLAGS=-lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs
BIN=median
OBJS=median.o sort.o utils.o merge.o
#OBJS=med.o utils.o

all: $(BIN)

$(BIN): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(BIN) $(LDFLAGS)

median.o: median.cc median.h sort.h merge.h
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(LDFLAGS)

sort.o: sort.cc sort.h
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(LDFLAGS)

merge.o: merge.cc merge.h
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(LDFLAGS)

utils.o: utils.cc utils.h
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(LDFLAGS)

run:
	./$(BIN) -i saltPepper0.png -w 7 -o filtered0.png
	./$(BIN) -i saltPepper1.png -w 3 -o filtered1.png

pack:
	zip -r xsimek23.zip *.cc *.h Makefile README.md doc.pdf saltPepper0.png saltPepper1.png
	cp xsimek23.zip xlisti00.zip 

clean:
	rm -f $(BIN) *.o
