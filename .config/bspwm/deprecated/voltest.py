import alsaaudio
import select

while True:
    mixer = alsaaudio.Mixer()
    poll = select.poll()
    poll.register(*(mixer.polldescriptors()[0]))
    print(poll.poll())
