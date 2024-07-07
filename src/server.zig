const std = @import("std");
const Server = @This();

port: u16,

pub fn init(server: *Server, port: u16) !void {
    server.* = .{
        .port = port,
    };
    std.debug.print("Hello from server (port: {})\n", .{port});
}
