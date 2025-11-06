#include "mainwindow.h"
#include <opencv2/opencv.hpp>
#include <iostream>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    cv::VideoCapture cap(0);
    if (!cap.isOpened()) {
        std::cerr << "Error: Cannot open the camera!" << std::endl;
        return;
    }

    cv::Mat frame;
    while (true) {
        cap >> frame;
        if (frame.empty()) break;

        cv::imshow("Webcam Stream", frame);
        if (cv::waitKey(30) == 27) break;
    }

    cap.release();
    cv::destroyAllWindows();
}

MainWindow::~MainWindow() {}
