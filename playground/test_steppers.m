## Make sure ../firmware/EggBot77/EggBot77.ino was flashed onto the
## ESP before running this

pkg load instrument-control
# If this fails install with "pkg -forge install instrument-control"
# only on GNU/Linux, BSD and OSX (the windows installer already includes it)

fn = glob ("/dev/ttyACM*"){1};
s = serial (fn, 9600, 5);

function echo_reply (s)
  printf ("reply: %s", char (srl_read (s, 100)));
endfunction

function EM (s, Axis1, Axis2)
  cmd = sprintf ("EM,%i,%i\r\n", Axis1, Axis2);
  srl_write (s, cmd);
  echo_reply (s);
endfunction

function SM (s, duration, AxisSteps1, AxisSteps2)
  cmd = sprintf ("SM,%i,%i,%i\r\n", duration, AxisSteps1, AxisSteps2);
  srl_write (s, cmd);
  echo_reply (s);
endfunction

function SetServoPos (s, id, percent)
  assert (id == 4 || id == 5);
  # from eggbot.py line 1056:1060
  # intTemp = 240 * ( self.options.penUpPosition + 25 )
  # (I guess old cruft from arduino times)
  cmd = sprintf ("SC,%i,%i\r\n", id, (percent + 25) * 240);
  srl_write (s, cmd);
  echo_reply (s);
endfunction

# query firmware version string
srl_write (s, "v\r");
echo_reply (s);

## Set pen positions to 30% and 70%
SetServoPos (s, 4, 20); # Pen down position
SetServoPos (s, 5, 70); # Pen up position

## Pen down
srl_write (s, "SP,1\r\n");

## Enable Motors
EM (s, 1, 1);

# Attention: this doesn't block until position is reached
for i = 1:8
  steps = 10000/i * merge(mod (i,2), -1, 1);
  SM (s, 2000, steps, steps);
endfor

## Disable Motors
EM (s, 0, 0);

## Pen up
srl_write (s, "SP,0\r\n");

echo_reply (s);

fclose (s)
