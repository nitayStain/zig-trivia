const std = @import("std");
const Server = @This();

pub fn init() !void {
    std.debug.print("Hello from server\n", .{});
}
