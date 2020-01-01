.. title: Iššokstantis terminalo langas bet kurioje vietoje
.. slug: issokstantis-terminalo-langas-bet-kurioje-vietoje
.. date: 2009-06-03 17:37:00 UTC+02:00
.. tags: shell, python, floss
.. type: text

Kadangi labai dažnai naudojuosi komandine eilute, tai labai patogu, kai
terminalo langas visada po ranka. Tam labai tinka Quake tipo terminalo langas,
kuris išvažiuoja iš ekrano viršaus paspaudus tam tikrą klavišų kombinaciją.
Gnome turi kažką panašaus – Tilda, tačiau paskutiniu metu `Tilda veikia labai
sunkiai <https://bugs.launchpad.net/ubuntu/+source/tilda/+bug/111571>`_, nuolat
segmentuoja, lūžinėja ir t.t.

Neapsikentęs sugalvojau padaryti kažką panašaus, į pagalbą vėl gi pasitelkiau
Python ir padariau tokią labai primityvią programikę, kurios pagrindinė
paskirtis – parodyti terminalo langą paspaudus tam tikrą klavišų kombinaciją.
Patalpinau programikę į `launchpad.net
<https://edge.launchpad.net/quaketerm/>`_. Taip pat žemiau pateikiu kodą,
kadangi jo nėra labai daug:

.. code-block:: python

    #!/usr/bin/env python
    
    import os
    import gtk, wnck
    import time; from datetime import datetime
    from deskbar.core.keybinder._keybinder \
        import tomboy_keybinder_bind as bindkey
    
    
    class QTerm:
    
        window = None
        
        def __init__(self, pid):
            self.pid = pid
            self.screen = wnck.screen_get_default()
            self.watch_handler = self.screen.connect('window-opened',
            self.watchWindow)
        
        def watchWindow(self, screen, window):
            if window.get_pid() == self.pid:
                self.window = window
                
                swidth = self.screen.get_width()
                width = swidth - (swidth / 10)
                height = 400
                x = (swidth/10)/2
                y = 0
                self.window.set_geometry(wnck.WINDOW_GRAVITY_CURRENT,
                                         (wnck.WINDOW_CHANGE_X |
                                          wnck.WINDOW_CHANGE_Y |
                                          wnck.WINDOW_CHANGE_WIDTH |
                                          wnck.WINDOW_CHANGE_HEIGHT),
                                         x, y, width, height)
                
                self.screen.disconnect(self.watch_handler)
        
        def getTimestamp(self):
            return int(time.mktime(datetime.now().timetuple()))
        
        def onHotKeyPress(self):
            if self.window:
                if (self.window.is_active()):
                    self.window.minimize()
                else:
                    self.window.activate(self.getTimestamp())
            else:
                print "Terminal window not found."
    
    
    if __name__ == '__main__':
        pid = os.fork()
        if pid == 0:
            os.execlp('xterm', '')
        else:
            qterm = QTerm(pid)
            bindkey("<Alt>grave", qterm.onHotKeyPress)
            try:
                gtk.main()
            except (KeyboardInterrupt, SystemExit):
                pass
    

Kad paleisti galima išsaugoti kodą į kokį nors failą ir jį paleisti su python.
Kaip programa bus paleista, turėtu iššokti XTerm langas. Jį paslėpti galima su
Grave (Alt + \`), su tais pačiais klavišais galima ir iškviesti.

Teoriškai vietoje XTerm galima naudoti bet kokį kitą terminalą, taip pat galima
pasikeisti ir klavišų kombinaciją. Keičiant terminalą reikia atminti, kad
terminalo lango PID turi sutapti su forkinto proceso PID, pavyzdžiui
gnome-terminal pats fokinasi, todėl lango PID būna kotoks ir klavišų
kombinacija neveikia.

Kad būtų pilnas komplektas, siūlau dar parsisiųsti puikią `Zenburn spalvų temą
XTermui <http://www.brockman.se/software/zenburn/look-zenburn.xrdb>`_.  Kadangi
Zenburn spalvų tema brockman.se serveryje yra kiek pasenus reikia į failo
pabaigą įdėti tokias eilutes::

    *VT100*foreground: #dcdccc
    *VT100*background: #3f3f3f

    *VT100*color0: #3f3f3f
    *VT100*color1: #705050
    *VT100*color2: #60b48a
    *VT100*color3: #dfaf8f
    *VT100*color4: #506070
    *VT100*color5: #dc8cc3
    *VT100*color6: #8cd0d3
    *VT100*color7: #dcdccc

    *VT100*color8: #709080
    *VT100*color9: #dca3a3
    *VT100*color10: #c3bf9f
    *VT100*color11: #f0dfaf
    *VT100*color12: #94bff3
    *VT100*color13: #ec93d3
    *VT100*color14: #93e0e3
    *VT100*color15: #ffffff

Ir tada viskas veiks tiesiog nepriekaištingai.

