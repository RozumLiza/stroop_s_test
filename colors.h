#ifndef COLORS_H
#define COLORS_H

#include <QObject>
#include <QVector>
#include <QRandomGenerator>

class Colors : public QObject
{
    Q_OBJECT
public:
    explicit Colors(QObject *parent = nullptr);

signals:

public slots:
    QVector<QString> newGame();
    QString random(int number);

};

#endif // COLORS_H
