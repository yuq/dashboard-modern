#include <QOpenGLFramebufferObject>
#include <QQuickWindow>
#include <QDebug>
#include <QOpenGLShaderProgram>
#include <QSGSimpleTextureNode>

#include "radarscaneffect.hpp"

class TextureNode : public QObject, public QSGSimpleTextureNode
{
    Q_OBJECT

public:
    TextureNode(QQuickWindow *window, RadarScanEffect *rs)
        : m_window(window), m_program(0), m_rs(rs), m_lt(0), m_nt(0), m_la(0), m_na(0), m_index(0)
    {
        m_texture[0] = m_texture[1] = 0;
        m_fbo[0] = m_fbo[1] = 0;
        connect(m_window, SIGNAL(beforeRendering()), this, SLOT(renderFBO()));
    }

    ~TextureNode()
    {
        delete m_texture[0];
        delete m_texture[1];
        delete m_fbo[0];
        delete m_fbo[1];
        delete m_program;
    }

    void setNew(qreal t, qreal a)
    {
        m_lt = m_nt;
        m_nt = t;

        m_la = m_na;
        m_na = a;
    }

public slots:
    void renderFBO()
    {
        QSize size = rect().size().toSize();

        if (!m_program) {
            m_program = new QOpenGLShaderProgram();
            m_program->addShaderFromSourceFile(QOpenGLShader::Vertex, "vert.glsl");
            m_program->addShaderFromSourceFile(QOpenGLShader::Fragment, "frag.glsl");
            m_program->link();

            QOpenGLFramebufferObjectFormat format;
            format.setAttachment(QOpenGLFramebufferObject::NoAttachment);
            m_fbo[0] = new QOpenGLFramebufferObject(size, format);
            m_fbo[1] = new QOpenGLFramebufferObject(size, format);
            m_texture[0] = m_window->createTextureFromId(m_fbo[0]->texture(), size);
            m_texture[1] = m_window->createTextureFromId(m_fbo[1]->texture(), size);
        }

        setTexture(m_texture[m_index]);

        m_program->bind();
        m_fbo[m_index]->bind();

        glViewport(0, 0, size.width(), size.height());

        int ni = (m_index + 1) % 2;

        GLuint vertex = m_program->attributeLocation("vertexIn");
        GLuint texcoord = m_program->attributeLocation("texcoordIn");
        GLuint sampler = m_program->uniformLocation("sampler");
        GLuint dt = m_program->uniformLocation("dt");
        GLuint angle = m_program->uniformLocation("angle");
        GLuint da = m_program->uniformLocation("da");
        m_program->setUniformValue(sampler, 0);
        setNew(m_rs->t(), m_rs->angle());
        m_program->setUniformValue(dt, (GLfloat)(m_nt - m_lt));
        m_program->setUniformValue(angle, (GLfloat)m_na);
        m_program->setUniformValue(da, (GLfloat)(m_na - m_la));

        m_program->enableAttributeArray(vertex);
        m_program->enableAttributeArray(texcoord);

        glActiveTexture(GL_TEXTURE0);
        m_texture[ni]->bind();

        GLfloat values[] = {
            -1, 1, 0,
            1, 1, 0,
            1, -1, 0,

            -1, 1, 0,
            -1, -1, 0,
            1, -1, 0,
        };
        m_program->setAttributeArray(vertex, GL_FLOAT, values, 3);

        GLfloat texvalues[] = {
            0, 1,
            1, 1,
            1, 0,

            0, 1,
            0, 0,
            1, 0,
        };
        m_program->setAttributeArray(texcoord, GL_FLOAT, texvalues, 2);

        glDrawArrays(GL_TRIANGLES, 0, 6);

        glBindTexture(GL_TEXTURE_2D, 0);
        m_program->disableAttributeArray(texcoord);
        m_program->disableAttributeArray(vertex);
        m_fbo[m_index]->bindDefault();
        m_program->release();

        m_index = ni;

        //qDebug() << "texture node update";

        m_window->update();
    }

private:
    QOpenGLFramebufferObject *m_fbo[2];
    QSGTexture *m_texture[2];
    QQuickWindow *m_window;
    QOpenGLShaderProgram *m_program;
    RadarScanEffect *m_rs;
    qreal m_lt;
    qreal m_nt;
    qreal m_la;
    qreal m_na;
    int m_index;
};


RadarScanEffect::RadarScanEffect(QQuickItem *parent) :
    QQuickItem(parent), m_t(0), m_angle(0)
{
    setFlag(ItemHasContents, true);
}

QSGNode *RadarScanEffect::updatePaintNode(QSGNode *node, UpdatePaintNodeData *)
{
    TextureNode *tnode;

    if (!node) {
        tnode = new TextureNode(window(), this);
        tnode->setRect(boundingRect());
        node = tnode;
    }
    else
        tnode = (TextureNode *)node;

    return node;
}

void RadarScanEffect::setT(qreal t)
{
    if (t == m_t)
        return;
    m_t = t;
    emit tChanged();
    if (window())
        window()->update();
}

void RadarScanEffect::setAngle(qreal angle)
{
    if (angle == m_angle)
        return;
    m_angle = angle;
    emit angleChanged();
    if (window())
        window()->update();
}

#include "radarscaneffect.moc"
