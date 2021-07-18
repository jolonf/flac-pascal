program FLACTester;

{
  Tests the FLAC unit by opening a 'test.flac' file and decoding to 'test.pcm'.

  test.pcm is a channel interleaved PCM file with bytes per sample calculated as
  the FLAC bits per sample rounded up to the next whole byte, e.g. 20 bits -> 3 bytes (24 bits)
}

uses
  Classes,
  BufStream,
  FLAC;

var
  flacStream: TBufferedFileStream;
  pcmStream: TBufferedFileStream;
  streamInfoBlock: TStreamInfoBlock;

begin
  { Open files }
  flacStream := TBufferedFileStream.Create('test.flac', fmOpenRead);
  pcmStream := TBufferedFileStream.Create('test.pcm', fmOpenWrite or fmCreate);

  { Perform conversion }
  FLAC2PCM(flacStream, pcmStream, streamInfoBlock);
  
  { Close files }
  pcmStream.Free();
  flacStream.Free();

  { Print out FLAC STREAMINFO block which contains information about the file }
  LogStreamInfoBlock(@streamInfoBlock);
end.