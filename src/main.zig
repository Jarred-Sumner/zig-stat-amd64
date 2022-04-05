const std = @import("std");

pub fn main() anyerror!void {
    const args = std.mem.span(std.os.argv);
    var stat_buf = std.mem.zeroes(std.os.darwin.Stat);
    _ = std.os.darwin.stat(try std.heap.c_allocator.dupeZ(u8, std.mem.span(args[args.len - 1])), &stat_buf);
    std.debug.print("\n Stat:\n {}\n", .{stat_buf});

    const fstat = try std.os.fstat(try std.os.open(try std.heap.c_allocator.dupeZ(u8, std.mem.span(args[args.len - 1])), 0, 0));
    std.debug.print("\nfstat:\n {}\n", .{fstat});
}
