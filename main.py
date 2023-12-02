import sys
from PySide6.QtCore import QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.load(QUrl.fromLocalFile("main.qml"))

if not engine.rootObjects():
    sys.exit(-1)

sys.exit(app.exec())