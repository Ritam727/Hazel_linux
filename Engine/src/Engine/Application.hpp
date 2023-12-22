#pragma once

#include "Core.hpp"

namespace Engine {
    class Application {
    public:
        Application();
        virtual ~Application();

        void run();
    };

    Application *CreateApplication();
}