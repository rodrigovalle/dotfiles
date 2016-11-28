import subprocess
import socket, os


class Bspc:
    def __init__(self):
        self.socket_path = os.getenv('BSPWM_SOCKET')
        self._connect()

    def _connect(self):
        self.socket = socket.socket(family=socket.AF_UNIX)
        self.socket.connect(self.socket_path)

    def _send(self, cmd):
        cmd.append('')
        ret = '\0'.join(cmd).encode()
        self.socket.sendall(ret)

    def _recv_line(self):
        """ line generator that loops through output received from bspwm """
        linebuffer = []
        while True:
            data = self.socket.recv(1024)
            if not data:
                if linebuffer:
                    yield b''.join(linebuffer)
                return

            for line in data.splitlines(True):
                # flush buffer if ends with newline + remove newline
                if line[-1] == 10:
                    linebuffer.append(line[:-1])
                    yield b''.join(linebuffer)
                    linebuffer = []
                else:
                    linebuffer.append(line)
    
    def queryNodes(self, monitor=None, desktop=None, node=None):
        cmd = ['query', '-N']
        for key, value in [('m', monitor), ('d', desktop), ('n', node)]:
            if value:
                cmd.append('-{}'.format(key))
                cmd.append(value)
        self._send(cmd)
        return list(self._recv_line())

    def config(self, key, value=None):
        if value:
            self._send(['config', key, value])
        else:
            self._send(['config', key])
            return next(self._recv_line())


if __name__ == '__main__':
    bspc = Bspc()
    bspc._send(['subscribe'])
    print(next(bspc._recv_line()))
