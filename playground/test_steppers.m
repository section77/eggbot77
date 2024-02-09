pkg load instrument-control

s = serial ("/dev/ttyACM0", 9600, 10);

srl_write (s, "v\r");
char (srl_read (s, 100))

function EM (s, Axis1, Axis2)
  cmd = sprintf ("EM,%i,%i\r\n", Axis1, Axis2);
  srl_write (s, cmd);
endfunction

function SM (s, duration, AxisSteps1, AxisSteps2)
  cmd = sprintf ("SM,%i,%i,%i\r\n", duration, AxisSteps1, AxisSteps2);
  srl_write (s, cmd);
endfunction

## Enable Motors
EM (s, 1, 1);

SM (s, 1000, 5000, 5000);
fflush (stdout);

## Disable Motors
#EM (s, 0, 0);


