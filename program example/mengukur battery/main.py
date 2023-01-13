

####### memanggil library PyQt5 ##################################
#----------------------------------------------------------------#
from PyQt5.QtCore import * 
from PyQt5.QtGui import * 
from PyQt5.QtQml import * 
from PyQt5.QtWidgets import *
from PyQt5.QtQuick import *  
import sys
import threading
import psutil
#----------------------------------------------------------------#
battery = 0
battery_level = 0
########## mengisi class table dengan instruksi pyqt5#############
#----------------------------------------------------------------#
class table(QObject):    
    def __init__(self, parent = None):
        super().__init__(parent)
        self.app = QApplication(sys.argv)
        self.engine = QQmlApplicationEngine(self)
        self.engine.rootContext().setContextProperty("backend", self)    
        self.engine.load(QUrl("main.qml"))
        sys.exit(self.app.exec_())
        
    @pyqtSlot(result=int)
    def battery(self):  return battery_level
#----------------------------------------------------------------#

def battery_process(num):
    global battery
    global battery_level
    
    while True:
        battery = psutil.sensors_battery()
        battery_level = int(battery.percent)
        print(battery_level)
    

########## memanggil class table di mainloop######################
#----------------------------------------------------------------#    
if __name__ == "__main__":
    t1 = threading.Thread(target=battery_process, args=(10,))
    t1.start()
    main = table()
    
    
#----------------------------------------------------------------#