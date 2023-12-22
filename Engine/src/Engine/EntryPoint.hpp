#pragma once
#include <iostream>

extern Engine::Application *Engine::CreateApplication();

int main(int argc, char **argv) {
    std::cout << "Game Engine\n";
    Engine::Application *app = Engine::CreateApplication();
    app->run();
    delete app;
}