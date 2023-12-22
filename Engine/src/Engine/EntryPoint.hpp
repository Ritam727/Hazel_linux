#pragma once
#include <iostream>

extern Engine::Application *Engine::CreateApplication();

int main(int argc, char **argv) {
    Engine::Log::Init();
    EG_CORE_WARN("Initialized Log!");
    EG_CLIENT_INFO("Hello");
    std::cout << "Game Engine\n";
    Engine::Application *app = Engine::CreateApplication();
    app->run();
    delete app;
}