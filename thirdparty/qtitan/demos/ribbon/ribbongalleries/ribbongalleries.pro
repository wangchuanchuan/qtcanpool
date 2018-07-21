TEMPLATE = app

QTITANDIR = $$quote($$(QTITANDIR))

isEmpty(QTITANDIR):QTITANDIR = $$quote($$PWD/../../..)

include($$QTITANDIR/src/shared/qtitanribbon.pri)

#DESTDIR = $$QTITANDIR/bin
include($$QTITANDIR/qtitan.pri)
DESTDIR = $$IDE_APP_PATH
DESTDIR = $$member(DESTDIR, 0)$$QTITAN_LIB_PREFIX

!debug_and_release|build_pass {
    CONFIG(debug, debug|release) {
        TARGET = $$member(TARGET, 0)d
    }
}

HEADERS        = mainwindow.h \
                 galleryItems.h

SOURCES        = main.cpp \
                 mainwindow.cpp \
                 galleryItems.cpp

RESOURCES     = ribbongalleries.qrc

include($$QTITANDIR/demos/shared/aboutdialog.pri)

macx {
    CONFIG-=app_bundle
}

!lessThan(QT_VER_MAJ, 5) {
  QT += printsupport
}
