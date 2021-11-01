% (C) Copyright 2021 CPP LePoulpe developers

function oneLedOn(ledPinId, timeOn)

  if narin < 2

    timeOn = 1;

  end

  dio = digitalio('nidaq','PXI1Slot4');

  myLines = [51:2:75] - 6;

  % opens communications in correpondings pins and set them as output
  addline(dio, myLines, 'out');

  trials = [11 7 3; 11 6 3]

  for trial = 1:2

      for led=1:3

          position = trials(trial, led) - 1;

          data = dec2binvec(2^(position), 13);

          % light on
          putvalue(dio, data);

          WaitSecs(timeOn);

      end

      putvalue(dio, 0);

      % light off
      WaitSecs(2);

  end

  putvalue(dio, 0); %light off

  delete(dio)
  clear dio
