import mido

mid = mido.MidiFile("midi-files/mongrel.MID")

left_map = []
right_map = []
up_map = []

current_tick = 0

# Get tempo
tempo = 0
for track in mid.tracks:
    for msg in track:
        if msg.type == "set_tempo":
            tempo = msg.tempo
            print(f"Set tempo to {tempo}")

if tempo == 0: tempo = 500_000 # default value of 120bpm

for msg in mid.tracks[0]:
    print(msg)
    if msg.type == "note_on":  
        current_tick += msg.time
        current_time = mido.tick2second(current_tick, mid.ticks_per_beat, tempo)
        match(msg.note):
            case 60:
                left_map.append(current_time)
                continue
            case 61:
                up_map.append(current_time)
                continue
            case 62:
                right_map.append(current_time)
                continue
            case _:
                print("Invalid note")
    elif msg.type == "note_off":
        current_tick += msg.time
    

print(f"left map: {left_map}")
print(f"up map: {up_map}")
print(f"right map: {right_map}")
