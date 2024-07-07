const std = @import("std");
const Server = @import("server.zig");

pub var server: Server = undefined;

pub fn main() !void {
    try server.init(12565);
    std.debug.print("Hello, world!\n", .{});
}
