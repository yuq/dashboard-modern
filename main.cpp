#include <QApplication>
#include <QQuickView>
#include <QQmlEngine>

#include "radarscaneffect.hpp"

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    qmlRegisterType<RadarScanEffect>("RadarScanEffect", 1, 0, "RadarScanEffect");

    QQuickView view;
    view.setSource(QUrl("main.qml"));
    app.connect(view.engine(), &QQmlEngine::quit, &QApplication::quit);

    view.show();
    app.exec();
    return 0;
}
