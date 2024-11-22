program Disassembler;

uses school;

var
  f: text;
  n, m: integer;
  s, t, s1, s2, s3, s4, s5, s6, s7, s8: string;
  ch1, ch2, ch3, ch4: char;

begin
  n := -2;
  t := '';
  assign(f, 'hexcod.txt');
  reset(f);
  while not eof(f) do
  begin
    readln(f, s);
    s1 := copy(s, 10, length(s) - 11);
    while s1 <> '' do
    begin
      s2 := copy(s1, 1, 4);
      s3 := s2;
      delete(s1, 1, 4);
      ch1 := s2[1];
      ch2 := s2[2];
      ch3 := s2[3];
      ch4 := s2[4];
      s2 := ch3 + ch4 + ch1 + ch2;
      m := dec(s2, 16);
      s2 := bin(m);
      s2 := '0' * (16 - length(s2)) + s2;
      while t = '' do
      begin
        n += 2;
        if s2 = '1001010000001001' then
        begin
          writeln(hex(n), ': ', s3, ' ijmp ');
          break
        end;
        if s2 = '1001010100001001' then
        begin
          writeln(hex(n), ': ', s3, ' icall ');
          break
        end;
        if s2 = '1001010100001000' then
        begin
          writeln(hex(n), ': ', s3, ' ret ');
          break
        end;
        if s2 = '1001010100011000' then
        begin
          writeln(hex(n), ': ', s3, ' reti ');
          break
        end;
        if s2 = '1001010000001000' then
        begin
          writeln(hex(n), ': ', s3, ' sec ');
          break
        end;
        if s2 = '1001010010001000' then
        begin
          writeln(hex(n), ': ', s3, ' clc ');
          break
        end;
        if s2 = '1001010000011000' then
        begin
          writeln(hex(n), ': ', s3, ' sez ');
          break
        end;
        if s2 = '1001010010011000' then
        begin
          writeln(hex(n), ': ', s3, ' clz ');
          break
        end;
        if s2 = '1001010000101000' then
        begin
          writeln(hex(n), ': ', s3, ' sen ');
          break
        end;
        if s2 = '1001010010101000' then
        begin
          writeln(hex(n), ': ', s3, ' cln ');
          break
        end;
        if s2 = '1001010000111000' then
        begin
          writeln(hex(n), ': ', s3, ' sev ');
          break
        end;
        if s2 = '1001010010111000' then
        begin
          writeln(hex(n), ': ', s3, ' clv ');
          break
        end;
        if s2 = '1001010001001000' then
        begin
          writeln(hex(n), ': ', s3, ' ses ');
          break
        end;
        if s2 = '1001010011001000' then
        begin
          writeln(hex(n), ': ', s3, ' cls ');
          break
        end;
        if s2 = '1001010001011000' then
        begin
          writeln(hex(n), ': ', s3, ' seh ');
          break
        end;
        if s2 = '1001010001011000' then
        begin
          writeln(hex(n), ': ', s3, ' clh ');
          break
        end;
        if s2 = '1001010001101000' then
        begin
          writeln(hex(n), ': ', s3, ' set ');
          break
        end;
        if s2 = '1001010011101000' then
        begin
          writeln(hex(n), ': ', s3, ' clt ');
          break
        end;
        if s2 = '1001010001111000' then
        begin
          writeln(hex(n), ': ', s3, ' sei ');
          break
        end;
        if s2 = '1001010011111000' then
        begin
          writeln(hex(n), ': ', s3, ' cli ');
          break
        end;
        if s2 = '0000000000000000' then
        begin
          writeln(hex(n), ': ', s3, ' nop ');
          break
        end;
        if s2 = '1001010110001000' then
        begin
          writeln(hex(n), ': ', s3, ' sleep ');
          break
        end;
        if s2 = '1001010110101000' then
        begin
          writeln(hex(n), ': ', s3, ' wdr ');
          break
        end;
        if s2 = '1001010111001000' then
        begin
          writeln(hex(n), ': ', s3, ' lpm ');
          break
        end;
        if s2 = '1001010111101000' then
        begin
          writeln(hex(n), ': ', s3, ' spm ');
          break
        end;
        s4 := copy(s2, 1, 7);
        s5 := copy(s2, 13, 3);
        if (s4 = '1001010') and (s5 = '110') then
        begin
          if s1 = '' then
          begin
            readln(f, s);
            s1 := copy(s, 10, length(s) - 11);
          end;
          s2 := copy(s1, 1, 4);
          write(hex(n), ': ', s3, ' ', s2, ' jmp ');
          delete(s1, 1, 4);
          ch1 := s2[1];
          ch2 := s2[2];
          ch3 := s2[3];
          ch4 := s2[4];
          s2 := ch3 + ch4 + ch1 + ch2;
          writeln('0x', hex(2 * dec(s2, 16)));
          n += 2;
          break
        end;
        if (s4 = '1001010') and (s5 = '111') then
        begin
          if s1 = '' then
          begin
            readln(f, s);
            s1 := copy(s, 10, length(s) - 11);
          end;
          s2 := copy(s1, 1, 4);
          write(hex(n), ': ', s3, ' ', s2, ' call ');
          delete(s1, 1, 4);
          ch1 := s2[1];
          ch2 := s2[2];
          ch3 := s2[3];
          ch4 := s2[4];
          s2 := ch3 + ch4 + ch1 + ch2;
          writeln('0x', hex(2 * dec(s2, 16)));
          n += 2;
          break
        end;
        s4 := copy(s2, 1, 8);
        s5 := copy(s2, 13, 4);
        if (s4 = '11101111') and (s4 = '1111') then
        begin
          s6 := copy(s2, 9, 4);
          writeln(hex(n), ': ', s3, ' ser r', 16 + dec(s6, 2));
          break
        end;
        s4 := copy(s2, 1, 8);
        if s4 = '00000001' then
        begin
          s6 := copy(s2, 9, 4);
          s7 := copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' movw r', 16 + dec(s6, 2), ', r', 16 + dec(s7, 2));
          break
        end;
        if s4 = '10011001' then
        begin
          s6 := copy(s2, 9, 5);
          s7 := copy(s2, 14, 3);
          writeln(hex(n), ': ', s3, ' sbic 0x', hex(dec(s6, 2)), ', ', dec(s7, 2));
          break
        end;
        if s4 = '10011000' then
        begin
          s6 := copy(s2, 9, 5);
          s7 := copy(s2, 14, 3);
          writeln(hex(n), ': ', s3, ' cbi 0x', hex(dec(s6, 2)), ', ', dec(s7, 2));
          break
        end;
        if s4 = '10011010' then
        begin
          s6 := copy(s2, 9, 5);
          s7 := copy(s2, 14, 3);
          writeln(hex(n), ': ', s3, ' sbi 0x', hex(dec(s6, 2)), ', ', dec(s7, 2));
          break
        end;
        if s4 = '10011011' then
        begin
          s6 := copy(s2, 9, 5);
          s7 := copy(s2, 14, 3);
          writeln(hex(n), ': ', s3, ' sbis 0x', hex(dec(s6, 2)), ', ', dec(s7, 2));
          break
        end;
        if s4 = '10010110' then
        begin
          s6 := copy(s2, 9, 2) + copy(s2, 13, 4);
          s7 := copy(s2, 11, 2);
          if s7 = '00' then
            s7 := '24';
          if s7 = '01' then
            s7 := '26';
          if s7 = '10' then
            s7 := '28';
          if s7 = '11' then
            s7 := '30';
          writeln(hex(n), ': ', s3, ' adiw r', s7, ', 0x', hex(dec(s6, 2)));
          break
        end;
        if s4 = '10010111' then
        begin
          s6 := copy(s2, 9, 2) + copy(s2, 13, 4);
          s7 := copy(s2, 11, 2);
          if s7 = '00' then
            s7 := '24';
          if s7 = '01' then
            s7 := '26';
          if s7 = '10' then
            s7 := '28';
          if s7 = '11' then
            s7 := '30';
          writeln(hex(n), ': ', s3, ' sbiw r', s7, ', 0x', hex(dec(s6, 2)));
          break
        end;
        s4 := copy(s2, 1, 7);
        s5 := copy(s2, 13, 4);
        if (s4 = '1001010') and (s5 = '0000') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' com r', dec(s6, 2));
          break
        end;
        if (s4 = '1001000') and (s5 = '1100') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', X');
          break
        end;
        if (s4 = '1001000') and (s5 = '1101') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', X+');
          break
        end;
        if (s4 = '1001000') and (s5 = '1110') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', -X');
          break
        end;
        if (s4 = '1000000') and (s5 = '1000') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', Y');
          break
        end;
        if (s4 = '1001000') and (s5 = '1001') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', Y+');
          break
        end;
        if (s4 = '1001000') and (s5 = '1010') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', -Y');
          break
        end;
        if (s4 = '1000000') and (s5 = '0000') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', Z');
          break
        end;
        if (s4 = '1001000') and (s5 = '0001') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', Z+');
          break
        end;
        if (s4 = '1001000') and (s5 = '0010') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ld r', dec(s6, 2), ', -Z');
          break
        end;
        if (s4 = '1001000') and (s5 = '0100') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' lpm r', dec(s6, 2), ', Z');
          break
        end;
        if (s4 = '1001000') and (s5 = '0101') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' lpm r', dec(s6, 2), ', Z+');
          break
        end;
        if (s4 = '1001001') and (s5 = '1111') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' push r', dec(s6, 2));
          break
        end;
        if (s4 = '1001000') and (s5 = '1111') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' pop r', dec(s6, 2));
          break
        end;
        if (s4 = '1001010') and (s5 = '0001') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' neg r', dec(s6, 2));
          break
        end;
        if (s4 = '1001010') and (s5 = '0011') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' inc r', dec(s6, 2));
          break
        end;
        if (s4 = '1001010') and (s5 = '1010') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' dec r', dec(s6, 2));
          break
        end;
        if (s4 = '1001010') and (s5 = '0110') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' lsr r', dec(s6, 2));
          break
        end;
        if (s4 = '1001010') and (s5 = '0111') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' ror r', dec(s6, 2));
          break
        end;
        if (s4 = '1001010') and (s5 = '0101') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' asr r', dec(s6, 2));
          break
        end;
        if (s4 = '1001010') and (s5 = '0010') then
        begin
          s6 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' swap r', dec(s6, 2));
          break
        end;
        s4 := copy(s2, 1, 6);
        s5 := copy(s2, 14, 3);
        if (s4 = '111101') and (s5 = '000') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brcc ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '000') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brcs ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111101') and (s5 = '001') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brne ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', 2 * (dec(s6, 2) + 1));
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '001') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' breq ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111101') and (s5 = '010') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brpl ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '010') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brmi ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111101') and (s5 = '011') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brvc ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '011') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brvs ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111101') and (s5 = '100') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brge ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '100') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brlt ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111101') and (s5 = '101') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brhc ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '101') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brhs ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111101') and (s5 = '110') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brtc ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '110') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brts ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111101') and (s5 = '111') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brid ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if (s4 = '111100') and (s5 = '111') then
        begin
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brie ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        s4 := copy(s2, 1, 6);
        if s4 = '000001' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' cpc r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '000010' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' sbc r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '000011' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' add r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '000100' then
        begin
          writeln(hex(n), ': ', s3, ' cpse ');
          break
        end;
        if s4 = '000101' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' cp r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '000110' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' sub r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '000111' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' adc r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '001000' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' and r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '001001' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' eor r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '001010' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' or r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '001011' then
        begin
          s6 := copy(s2, 8, 5);
          s7 := s2[7] + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' mov r', dec(s6, 2), ', r', dec(s7, 2));
          break
        end;
        if s4 = '111101' then
        begin
          s6 := copy(s2, 14, 3);
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brbc ', dec(s6, 2), ', ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        if s4 = '111100' then
        begin
          s6 := copy(s2, 14, 3);
          s7 := copy(s2, 7, 7);
          write(hex(n), ': ', s3, ' brbs ', dec(s6, 2), ', ');
          if s7[1] = '1' then
          begin
            s6 := '';
            for var i := 1 to 7 do
              if s7[i] = '1' then
                s6 := s6 + '0'
              else
                s6 := s6 + '1';
            writeln('-', dec(s6, 2) + 1);
          end
          else
            writeln('+', dec(s7, 2));
          break
        end;
        s4 := copy(s2, 1, 5);
        if s4 = '10111' then
        begin
          s6 := copy(s2, 6, 2) + copy(s2, 13, 4);
          s7 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' out 0x', hex(dec(s6, 2)), ', r', dec(s7, 2));
          break
        end;
        if s4 = '10110' then
        begin
          s6 := copy(s2, 6, 2) + copy(s2, 13, 4);
          s7 := copy(s2, 8, 5);
          writeln(hex(n), ': ', s3, ' in r', dec(s7, 2), ', 0x', hex(dec(s6, 2)));
          break
        end;
        s4 := copy(s2, 1, 4);
        if s4 = '0101' then
        begin
          s6 := copy(s2, 9, 4);
          s7 := copy(s2, 5, 4) + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' subi r', 16 + dec(s6, 2), ', 0x', hex(dec(s7, 2)));
          break
        end;
        if s4 = '0100' then
        begin
          s6 := copy(s2, 9, 4);
          s7 := copy(s2, 5, 4) + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' sbci r', 16 + dec(s6, 2), ', 0x', hex(dec(s7, 2)));
          break
        end;
        if s4 = '0011' then
        begin
          s6 := copy(s2, 9, 4);
          s7 := copy(s2, 5, 4) + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' cpi r', 16 + dec(s6, 2), ', 0x', hex(dec(s7, 2)));
          break
        end;
        if s4 = '0111' then
        begin
          s6 := copy(s2, 9, 4);
          s7 := copy(s2, 5, 4) + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' cbr r', 16 + dec(s6, 2), ', 0x', hex(dec(s7, 2)));
          break
        end;
        if s4 = '0110' then
        begin
          s6 := copy(s2, 9, 4);
          s7 := copy(s2, 5, 4) + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' sbr r', 16 + dec(s6, 2), ', 0x', hex(dec(s7, 2)));
          break
        end;
        if s4 = '1100' then
        begin
          s6 := copy(s2, 5, 12);
          if s6[1] = '0' then
          begin
            s6 := s6 + '0';
            writeln(hex(n), ': ', s3, ' rjmp +', dec(s6, 2));
          end
          else
          begin
            s7 := '';
            for var i := 1 to 12 do
              if s6[i] = '1' then
                s7 := s7 + '0'
              else
                s7 := s7 + '1';
            s7 := s7 + '0';
            writeln(hex(n), ': ', s3, ' rjmp -', dec(s7, 2) + 2)
          end;
          break
        end;
        if s4 = '1101' then
        begin
          s6 := copy(s2, 5, 12);
          if s6[1] = '0' then
          begin
            s6 := s6 + '0';
            writeln(hex(n), ': ', s3, ' rcall +', dec(s6, 2));
          end
          else
          begin
            s7 := '';
            for var i := 1 to 12 do
              if s6[i] = '1' then
                s7 := s7 + '0'
              else
                s7 := s7 + '1';
            s7 := s7 + '0';
            writeln(hex(n), ': ', s3, ' rcall -', dec(s7, 2) + 2)
          end;
          break
        end;
        if s4 = '1110' then
        begin
          s6 := copy(s2, 9, 4);
          s7 := copy(s2, 5, 4) + copy(s2, 13, 4);
          writeln(hex(n), ': ', s3, ' ldi r', 16 + dec(s6, 2), ', 0x', hex(dec(s7, 2)));
          break
        end;
        writeln(hex(n), ': ', s3);
        break
      end;
    end;
  end;
  close(f);
end.