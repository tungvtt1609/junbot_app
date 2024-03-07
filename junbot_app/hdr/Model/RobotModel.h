#ifndef ROBOTMODEL_H
#define ROBOTMODEL_H

#include <QObject>
#include <QString>

class RobotModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int battery          READ battery        WRITE setBattery        NOTIFY batteryChanged       FINAL)
    Q_PROPERTY(int batteryState     READ batteryState   WRITE setBatteryState   NOTIFY batteryStateChanged  FINAL)
    Q_PROPERTY(int controlState     READ controlState   WRITE setControlState   NOTIFY controlStateChanged  FINAL)
    Q_PROPERTY(int missionState     READ missionState   WRITE setMissionState   NOTIFY missionStateChanged  FINAL)
    Q_PROPERTY(int sensorState      READ sensorState    WRITE setSensorState    NOTIFY sensorStateChanged   FINAL)
    Q_PROPERTY(QString time         READ time           WRITE setTime           NOTIFY timeChanged          FINAL)
    Q_PROPERTY(QString obstacleState         READ obstacleState           WRITE setObstacleState           NOTIFY obstacleStateChanged          FINAL)
public:
    static RobotModel *getInstance();
    ~RobotModel() = default;

    int battery() const;
    void setBattery(int newBattery);

    int batteryState() const;
    void setBatteryState(int newBatteryState);

    int controlState() const;
    void setControlState(int newControlState);

    int missionState() const;
    void setMissionState(int newMissionState);

    int sensorState() const;
    void setSensorState(int newSensorState);

    QString time() const;
    void setTime(const QString &newTime);

    QString obstacleState() const;
    void setObstacleState(const QString &newTime);


signals:
    void batteryChanged();
    void batteryStateChanged();
    void controlStateChanged();
    void missionStateChanged();
    void sensorStateChanged();
    void timeChanged();
    void obstacleStateChanged();

private:
    explicit RobotModel(QObject *parent = nullptr);

    int m_battery;
    int m_batteryState;
    int m_controlState;
    int m_missionState;
    int m_sensorState;
    QString m_time;
    QString m_obState;
};

#endif // ROBOTMODEL_H
