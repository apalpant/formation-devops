import sys
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *


class DockDemo(QMainWindow):
    def __init__(self, parent=None):
        super(DockDemo, self).__init__(parent)

        self.createMenu()

        self.createTabs()

        self.createDock()
        self.createDock2()

        self.setWindowTitle('Dock')

    # Manage menu
    def createMenu(self):
        bar = self.menuBar()
        file = bar.addMenu('File')
        file.addAction('New')
        file.addAction('Save')
        file.addAction('Quit')

    # Manage dock
    def createDock(self):
        self.items = QDockWidget('Dock items', self)

        self.createTable()
        self.items.setWidget(self.tableWidget)

        self.items.setFloating(False)

        self.addDockWidget(Qt.RightDockWidgetArea, self.items)

    # Manage dock
    def createDock2(self):
        self.dock = QDockWidget('Dock TextEdit', self)

        self.dock.setWidget(QTextEdit())

        self.dock.setFloating(False)

        self.addDockWidget(Qt.TopDockWidgetArea, self.dock)

    # Manage tabs
    def createTabs(self):
        # Initialize tab screen
        self.tabs = QTabWidget()
        self.tab1 = QWidget()
        self.tab2 = QWidget()
        self.tabs.resize(300, 200)

        # Add tabs
        self.tabs.addTab(self.tab1, "Tab 1")
        self.tabs.addTab(self.tab2, "Tab 2")

        self.listWidget = QListWidget()
        self.listWidget.addItem('Item1')
        self.listWidget.addItem('Item2')
        self.listWidget.addItem('Item3')
        self.listWidget.addItem('Item4')

        # Create first tab
        self.tab1.layout = QVBoxLayout(self.tabs)
        self.tab1.layout.addWidget(self.listWidget)
        self.tab1.setLayout(self.tab1.layout)

        self.tab2.layout = QVBoxLayout(self.tabs)

        data = {"Project A": ["file_a.py", "file_a.txt", "something.xls"],
                "Project B": ["file_b.csv", "photo.jpg"],
                "Project C": []}

        self.tree = QTreeWidget()
        self.tree.setColumnCount(2)
        self.tree.setHeaderLabels(["Name", "Type"])

        items = []

        for key, values in data.items():
            item = QTreeWidgetItem([key])
            for value in values:
                ext = value.split(".")[-1].upper()
                child = QTreeWidgetItem([value, ext])
                item.addChild(child)
            items.append(item)

        self.tree.insertTopLevelItems(0, items)

        self.tab2.layout.addWidget(self.tree)

        self.tab2.setLayout(self.tab2.layout)

        self.setCentralWidget(self.tabs)

    # Create table
    def createTable(self):
        self.tableWidget = QTableWidget()

        # Row count
        self.tableWidget.setRowCount(4)

        # Column count
        self.tableWidget.setColumnCount(2)

        self.tableWidget.setItem(0, 0, QTableWidgetItem("Name"))
        self.tableWidget.setItem(0, 1, QTableWidgetItem("City"))
        self.tableWidget.setItem(1, 0, QTableWidgetItem("Aloysius"))
        self.tableWidget.setItem(1, 1, QTableWidgetItem("Indore"))
        self.tableWidget.setItem(2, 0, QTableWidgetItem("Alan"))
        self.tableWidget.setItem(2, 1, QTableWidgetItem("Bhopal"))
        self.tableWidget.setItem(3, 0, QTableWidgetItem("Arnavi"))
        self.tableWidget.setItem(3, 1, QTableWidgetItem("Mandsaur"))

        # Table will fit the screen horizontally
        self.tableWidget.horizontalHeader().setStretchLastSection(True)
        self.tableWidget.horizontalHeader().setSectionResizeMode(
            QHeaderView.Stretch)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    demo = DockDemo()
    demo.show()
    sys.exit(app.exec_())
