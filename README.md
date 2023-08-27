(This repository exists specifically for [open3DMM](https://open3dmm.com). Any other usecase at this time is to be considered unsupported.)

This is a fork of [audioman-decomp](https://github.com/benstone/audioman-decomp), packaged for Zig. Unnecessary
files have been deleted, and the build system has been replaced with
`build.zig`. The `upstream` branch of this repository contains a mirror of the
original source tree. When the upstream repository is updated, the changes are
merged from `upstream` into this `main` branch.

Original README:

----------------

# AudioMan-Decomp

This project is a decompilation of the AudioMan sound mixer library used in Microsoft 3D Movie Maker (3DMM). It is based on reverse engineering of the AudioMan debug static library, [audiod.lib](https://github.com/foone/3DMMForever/blob/main/kauai/elib/wind/audiod.lib).

The static library includes function names, variable names, logging, asserts and unoptimized versions of functions. It does not include class or structure layouts - these have been reverse engineered.

**NOTE:** This decompilation is only intended for use with the 3D Movie Maker source code. I would not recommend you use it in other projects.

## Progress

* Complete
	* CAMBiasFilter
	* CAMCacheFilter
	* CAMClipFilter
	* CAMGateFilter
	* CAMLoopFilter
	* CAMPassThruFilter
	* CAMRIFFStream
	* CAMTrimFilter
	* CAMWavFileSrc
	* CClassFactory
	* CDebugMem
	* CFileStream
	* CMemoryStream
	* CRIFF
	* CFakeOut
	* CMixerOut
	* CRealOut
	* MUTX
* Partially implemented
	* CAMConvertFilter: working, missing some PCM audio conversion functions (these formats are currently handled by the Audio Compression Manager)
	* CAMChannel: working, some unused functions missing
	* CAMMixer: working, some unused functions missing
* Not implemented (not required by 3DMM)
	* CAMAppendFilter
	* CAMDelayFilter
	* CAMDistortFilter
	* CAMScheduleFilter
	* CAMStereoFilter

## Building

Use CMake to build the project with Visual Studio 2022. Older versions of Visual Studio might work but haven't been tested.

## Testing

A test program `FilterDemo.exe` is included for testing audio filters.
