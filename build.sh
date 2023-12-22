cd Engine/src

export ENGINE_SRC_PATH=$(pwd)

export LD_LIBRARY_PATH=$ENGINE_SRC_PATH
export CPLUS_INCLUDE_PATH=$ENGINE_SRC_PATH
export C_INCLUDE_PATH=$ENGINE_SRC_PATH

cd ../vendor/spdlog/include

export CPLUS_INCLUDE_PATH=$(pwd):"$CPLUS_INCLUDE_PATH"
export C_INCLUDE_PATH=$(pwd):"$C_INCLUDE_PATH"

cd ../../../src

g++ -c -fPIC Engine/*.cpp
g++ -shared -o libEngine.so *.o

rm *.o

cd ../../
g++ Sandbox/src/SandboxApp.cpp -L $ENGINE_SRC_PATH -lEngine -o main