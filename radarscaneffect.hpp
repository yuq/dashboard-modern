#ifndef RADARSCANEFFECT_HPP
#define RADARSCANEFFECT_HPP

#include <QQuickItem>

class RadarScanEffect : public QQuickItem
{
    Q_OBJECT

    Q_PROPERTY(qreal t READ t WRITE setT NOTIFY tChanged)
    Q_PROPERTY(qreal angle READ angle WRITE setAngle NOTIFY angleChanged)

public:
    explicit RadarScanEffect(QQuickItem *parent = 0);

    qreal t() const { return m_t; }
    void setT(qreal t);

    qreal angle() const { return m_angle; }
    void setAngle(qreal angle);

protected:
    QSGNode *updatePaintNode(QSGNode *, UpdatePaintNodeData *);
    
signals:
    void tChanged();
    void angleChanged();
    
public slots:

private:
    qreal m_t;
    qreal m_angle;
};

#endif // RADARSCANEFFECT_HPP
