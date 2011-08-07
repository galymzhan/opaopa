TESTDIR := ./tests
CPPFILES := Pixel.cpp PixelCellMatrix.cpp main.cpp
CXX_FLAGS = -std=c++0x
LINK_FLAGS := -lgdi32

all: app test

app: $(CPPFILES)
	g++ $(CPPFILES) -o app.exe $(LINK_FLAGS) $(CXX_FLAGS)

test: runner.exe
	runner.exe

runner.exe: runner.cpp app
	g++ -I $(TESTDIR)/include -o runner.exe runner.cpp $(CPPFILES) $(LINK_FLAGS) $(CXX_FLAGS)

runner.cpp:
	python $(TESTDIR)/cxxtestgen.py --error-printer -o runner.cpp $(TESTDIR)/*.h