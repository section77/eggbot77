more off

pkg load instrument-control

s = serial ("/dev/ttyACM0", 9600, 10);

srl_write (s, "v\r");
char (srl_read (s, 100))

if (! exist ("matlab-midi", "dir"))
  system ("git clone https://github.com/kts/matlab-midi.git");
endif
addpath ("matlab-midi/src");

function read_eply (s)
  reply = char(srl_read (s, 4));
endfunction

function EM (s, Axis1, Axis2)
  cmd = sprintf ("EM,%i,%i\r\n", Axis1, Axis2);
  srl_write (s, cmd);
endfunction

function SM (s, duration, AxisSteps1, AxisSteps2)
  cmd = sprintf ("SM,%i,%i,%i\r\n", duration, AxisSteps1, AxisSteps2);
  srl_write (s, cmd);
endfunction

x = readmidi ("test.midi");

[notes_o, ~] = midiInfo (x, 0);

## nur ein Track extrahieren
chan = 2;
notes = notes_o(notes_o(:,1) == chan, :);

## crop
#notes = notes(1:20,:);

## actual pos, assume start centeres
egg_y_pos = 0
egg_y_sign = 1;

## Enable Motors
EM (s, 1, 1);

delays = notes (2:end, 5) - notes (1:end-1, 6);
for i=1:size(notes,1)

  if (i > 1 && delays(i-1) > 0)
    printf ("pause %.2fs...\n", delays (i-1));
    pause (delays (i-1));
  endif

  f = midi2freq(notes(i,3));
  dur = notes(i,6) - notes(i,5);
  amp = notes(i,4)/127;

  steps = 0.9 * dur * f;

  ## would it overflow?
  if ((egg_y_pos + steps) > 400)
    egg_y_sign = -1;
  elseif ((egg_y_pos - steps) < -400)
    egg_y_sign = 1;
  endif
  egg_y_pos += egg_y_sign * steps

  SM (s, 0.9 * dur * 1000, egg_y_sign * steps, egg_y_sign * steps);
  pause (dur);

  #v = 50 * f / CLK_PER_M;
  #new_pos += 0.8 * v * dur;

  #printf ("f = %.2fHz, dur = %.2fs, v = %.2fmm/s, new_pos = %.2fmm\n", f, dur, v*1e3, new_pos*1e3);
  #printf ("f = %.2fHz, dur = %.2fs\n", f, dur);
  fflush (stdout);

  #MoveAbs (0, new_pos, v, -F_MAX, F_MAX, 1, 0, 0, 0)
  #wait_until_done()

end

## Disable Motors
EM (s, 0, 0);


