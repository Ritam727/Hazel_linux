OBJ = Application.o Log.o
EP = Engine/src/Engine
HEADERS = $(EP)/Core.hpp $(EP)/Application.hpp $(EP)/Log.hpp $(EP).hpp
FILES = $(EP)/Log.cpp $(EP)/Application.cpp
ENTRY_POINT = $(EP)/EntryPoint.hpp
ENGINE_SRC_PATH = $(shell pwd)/Engine/src
LD_LIBRARY_PATH = $(ENGINE_SRC_PATH)
CPLUS_INCLUDE_PATH = $(ENGINE_SRC_PATH)
C_INCLUDE_PATH = $(ENGINE_SRC_PATH)
CPLUS_INCLUDE_PATH := $(shell pwd)/Engine/vendor/spdlog/include:$(CPLUS_INCLUDE_PATH)
C_INCLUDE_PATH := $(shell pwd)/Engine/vendor/spdlog/include:$(C_INCLUDE_PATH)

main: Sandbox/src/SandboxApp.cpp Engine/src/libEngine.so $(ENTRY_POINT)
	g++ $< -L $(LD_LIBRARY_PATH) -lEngine -o $@
	
Engine/src/libEngine.so: $(OBJ)
	g++ -shared -o $@ $^

%.o: $(EP)/%.cpp $(EP)/%.hpp
	g++ -c -fPIC -o $@ $<

clean:
	rm main Engine/src/libEngine.so

clear:
	rm *.o