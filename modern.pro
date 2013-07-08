QT += qml opengl quick

SOURCES += main.cpp \ 
    radarscaneffect.cpp
HEADERS += \ 
    radarscaneffect.hpp

OTHER_FILES += main.qml \
    vert.glsl \
    frag.glsl
