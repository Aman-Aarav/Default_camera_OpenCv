QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h



win32-g++ {
    message("Using MinGW OpenCV")
    INCLUDEPATH += C:/opencv-mingw/OpenCV-MinGW/include/
    CONFIG(debug, debug|release) {
        LIBS += -LC:/opencv-mingw/opencv-mingw/x64/mingw/lib \
            -lopencv_core452 \
            -lopencv_videoio452 \
            -lopencv_highgui452 \
            -lopencv_imgproc452
    } else {
        LIBS += -LC:/opencv-mingw/opencv-mingw/x64/mingw/lib \
            -lopencv_core452 \
            -lopencv_videoio452 \
            -lopencv_highgui452 \
            -lopencv_imgproc452
    }
}

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
