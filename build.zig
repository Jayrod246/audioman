const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "audioman",
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    lib.root_module.sanitize_c = false;
    lib.addCSourceFiles(.{ .files = audioman_sources, .flags = audioman_cflags });
    lib.addIncludePath(.{ .path = "src" });
    lib.addIncludePath(.{ .path = "inc" });
    lib.installHeadersDirectory(.{ .path = "inc" }, "", .{});
    lib.linkSystemLibrary("winmm");
    lib.linkSystemLibrary("msacm32");
    b.installArtifact(lib);
}

const audioman_cflags: []const []const u8 = &.{
    "-w",
    "-fms-extensions",
    "-fno-rtti",
    "-fno-exceptions",
};

const audioman_sources: []const []const u8 = &.{
    "src/audio.cpp",
    "src/audioman.cpp",
    "src/cchannel.cpp",
    "src/cfakeout.cpp",
    "src/cmixer.cpp",
    "src/cmixlib.cpp",
    "src/cmixout.cpp",
    "src/convert.cpp",
    "src/cplaysnd.cpp",
    "src/crealout.cpp",
    "src/cwaveout.cpp",
    "src/debugmem.cpp",
    "src/dpf.cpp",
    "src/factory.cpp",
    "src/mutex.cpp",
    "src/riff.cpp",
    "src/riffstrm.cpp",
    "src/sndapend.cpp",
    "src/sndbias.cpp",
    "src/sndcache.cpp",
    "src/sndclip.cpp",
    "src/sndcnvt.cpp",
    "src/snddist.cpp",
    "src/sndecho.cpp",
    "src/sndfader.cpp",
    "src/sndgain.cpp",
    "src/sndgate.cpp",
    "src/sndloop.cpp",
    "src/sndmix.cpp",
    "src/sndmute.cpp",
    "src/sndpass.cpp",
    "src/sndrand.cpp",
    "src/sndsched.cpp",
    "src/sndstreo.cpp",
    "src/sndtrim.cpp",
    "src/sound.cpp",
    "src/stream.cpp",
    "src/todo.cpp",
    "src/utils.cpp",
};
