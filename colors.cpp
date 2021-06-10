#include "colors.h"

Colors::Colors(QObject *parent) : QObject(parent)
{

}

QVector<QString> Colors::newGame() {
    QVector<QString> colors;

    colors.push_back(random(4));
again:
    QString i = random(4);
    if (i != colors.value(0)) colors.push_back(i);
    else goto again;
again1:
    i = random(4);
    if (i != colors.value(0) && i != colors.value(1)) colors.push_back(i);
    else goto again1;
again2:
    i = random(4);
    if (i != colors.value(0) && i != colors.value(1) && i != colors.value(2)) colors.push_back(i);
    else goto again2;

    colors.push_back(random(4));
    colors.push_back(random(4));

//again3:
//    i = random(4);
//    if (i != colors.value(4)) colors.push_back(i);
//    else goto again3;
//    for (int i = 0; i < 6; i++) colors.push_back(random(4));
//    while (colors.value(1) == colors.value(0)) colors.operator[](1) = random(4);
//    while (colors.value(2) == colors.value(0) || colors.value(2) == colors.value(1)) colors.operator[](2) = random(4);
//    while (colors.value(3) == colors.value(0) || colors.value(3) == colors.value(1) || colors.value(2) == colors.value(0)) colors.operator[](3) = random(4);
    while (colors.value(4) == colors.value(5)) colors.operator[](5) = random(4);
    return colors;
}

QString Colors::random(int number) {
    QRandomGenerator *qrg = QRandomGenerator::global();
    int rg = qrg->bounded(number);
    if (rg == 0) {
        return "red";
    }
    if (rg == 1) {
        return "blue";
    }
    if (rg == 2) {
        return "yellow";
    }
    if (rg == 3) {
        return "green";
    }
    return "blue";
}
