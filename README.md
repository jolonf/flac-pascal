# flac-pascal
FLAC decoder in Pascal.

## Usage

The `FLAC` unit in `flac.pas` contains a FLAC decoder which can be invoked using the following function:

```pascal
function FLAC2PCM(flac: TStream; 
                  pcm: TStream; 
                  var streamInfoBlock: TStreamInfoBlock): LongWord;
```

- `flac`: `TStream` containing a FLAC file.
- `pcm`: `TStream` where the decoded FLAC file will be written to.
- `streamInfoBlock`: `TStreamInfoBlock` contains metadata about the FLAC file such as number of channels, sample rate, and bits per sample. Useful fields are listed below:

```pascal
  TStreamInfoBlock = record
    sampleRate:           DWord; 
    numberOfChannels:     Word;  
    bitsPerSample:        Word;  
    totalSamplesInStream: Int64; 
    bytesPerSample:       Integer;
  end;
```

- `returns`: `FLAC_STATUS_SUCCESS` if successful.

The PCM format produced is big endian, interleaved channels, where the bytes per sample is rounded up to the nearest byte, e.g. if the FLAC file contains 20 bits per sample, it will be rounded up to 24 bits (3 bytes). `TStreamInfoBlock.bytesPerSample` also contains the bytes per sample of the PCM.

## Sample Program

Included is a sample program `FLACTester.pas` which converts a `test.flac` file to `test.pcm`. It also prints out the `TStreamInfoBlock` for the FLAC file.

## Supported

- [x] All sample rates
- [x] All channel configurations, up to 8 channels
- [x] Up to 32 bits per sample
- [x] All encoding modes (constant, verbatim, fixed, and LPC)
- [ ] Well tested
- [ ] Error handling
