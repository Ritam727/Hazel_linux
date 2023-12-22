cd Engine/src

export ENGINE_SRC_PATH=$(pwd)

export LD_LIBRARY_PATH=$ENGINE_SRC_PATH:"$LD_LIBRARY_PATH"
export CPLUS_INCLUDE_PATH=$ENGINE_SRC_PATH:"$CPLUS_INCLUDE_PATH"
export C_INCLUDE_PATH=$ENGINE_SRC_PATH:"$C_INCLUDE_PATH"

g++ -c -fPIC Engine/*.cpp
g++ -shared -o libEngine.so *.o

rm *.o

cd ../../Sandbox
g++ src/SandboxApp.cpp -L $ENGINE_SRC_PATH -lEngine -o main